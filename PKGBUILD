# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>

pkgname="log4qt"
pkgver=1.5.1
pkgrel=1
pkgdesc="Logging for the Qt cross-platform application framework"
license=('Apache License 2, Version 2.0')
arch=('x86_64' 'i686')
url="https://github.com/MEONMedical/Log4Qt"
depends=('qt5-base>=5.12')
options=(!strip)
source=("https://github.com/MEONMedical/Log4Qt/archive/v${pkgver}.tar.gz")
sha512sums=('aa36c70d2fea5f0b6e16c316fd4e57f9f04b8650fe20953a25c6cf7e38d9bb295f81893cd8257e490663cecad2549c7e650c7c0f86a9612d2ef7702282b3724a')

prepare() {
	cd "${srcdir}/Log4Qt-${pkgver}"
	qmake "QT += sql"
}

build() {
	cd "${srcdir}/Log4Qt-${pkgver}"
	make
}

package() {
	cd "${srcdir}/Log4Qt-${pkgver}"

	install -Dm755 bin/liblog4qt.so.1.0.0 "${pkgdir}"/usr/lib/liblog4qt.so.${pkgver}
	ln -sf liblog4qt.so.${pkgver} "${pkgdir}"/usr/lib/liblog4qt.so.${pkgver%.*}
	ln -sf liblog4qt.so.${pkgver} "${pkgdir}"/usr/lib/liblog4qt.so.${pkgver%%.*}
	ln -sf liblog4qt.so.${pkgver} "${pkgdir}"/usr/lib/liblog4qt.so
	ln -sf liblog4qt.so.${pkgver} "${pkgdir}"/usr/lib/liblog4qt.so.1.0.0
	ln -sf liblog4qt.so.${pkgver} "${pkgdir}"/usr/lib/liblog4qt.so.1.0

	install -Dm644 -t "${pkgdir}/usr/include/log4qt" include/log4qt/*
	for _i in '' '/helpers' '/spi' '/varia'; do
		install -Dm644 -t "${pkgdir}/usr/include/log4qt${_i}" src/log4qt${_i}/*.h
	done

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	for _d in ChangeLog.md Readme.md; do
		install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${_d}"
	done
}

# vim:set ts=4 sw=4 ai:
