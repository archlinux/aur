# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>

pkgname="log4qt"
pkgver=1.5.0
pkgrel=1
pkgdesc="Logging for the Qt cross-platform application framework"
license=('Apache License 2, Version 2.0')
arch=('x86_64' 'i686')
url="https://github.com/MEONMedical/Log4Qt"
depends=('qt5-base>=5.7')
options=(!strip)
source=("https://github.com/MEONMedical/Log4Qt/archive/v${pkgver}.tar.gz")
sha512sums=('a8053ca0c8177dd500b1ba828ec6da4f7be008e018e0ea787f33ddd604e00c4b67375c8cd55b153726c88dd8b6b3efd45d92d92e2cf2948b1ca54407af145f6c')

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
