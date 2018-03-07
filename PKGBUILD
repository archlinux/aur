# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>

pkgname="log4qt"
pkgver=1.4.2
pkgrel=1
pkgdesc="Logging for the Qt cross-platform application framework"
license=('Apache License 2, Version 2.0')
arch=('x86_64' 'i686')
url="https://github.com/MEONMedical/Log4Qt"
depends=('qt5-base>=5.6')
options=(!strip)
source=("https://github.com/MEONMedical/Log4Qt/archive/v${pkgver}.tar.gz")
sha512sums=('b7a42175301d0ae189302a5563f293a385a506f021450cfb5a8bb6856613209918320259de8c7d097836c25b1a262809ea843280f0547c4112ef3bd6d5e67f3f')

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
