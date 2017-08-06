# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>

pkgname="log4qt"
pkgver=1.4.1
pkgrel=1
pkgdesc="Logging for the Qt cross-platform application framework"
license=('Apache License 2, Version 2.0')
arch=('x86_64' 'i686')
url="https://github.com/MEONMedical/Log4Qt"
depends=('qt5-base>=5.3')
options=(!strip)
source=("https://github.com/MEONMedical/Log4Qt/archive/v${pkgver}.tar.gz")
sha512sums=('6544ee91b9fe33ceffcf8f6a03a21207741a31cfa1c9ebce6851ca267427a069327cb170dbb0c81e4256c96067c0908a7236cc1c173b7212a1e745f7b8be987b')

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

	install -Dm755 bin/liblog4qt.so.1.0.0 "${pkgdir}"/usr/lib/liblog4qt.so.1.4.1
	ln -sf liblog4qt.so.1.4.1 "${pkgdir}"/usr/lib/liblog4qt.so.1.4
	ln -sf liblog4qt.so.1.4.1 "${pkgdir}"/usr/lib/liblog4qt.so.1
	ln -sf liblog4qt.so.1.4.1 "${pkgdir}"/usr/lib/liblog4qt.so
	ln -sf liblog4qt.so.1.4.1 "${pkgdir}"/usr/lib/liblog4qt.so.1.0.0
	ln -sf liblog4qt.so.1.4.1 "${pkgdir}"/usr/lib/liblog4qt.so.1.0

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
