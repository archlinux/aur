#Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

_pkgname=libqpsd
pkgname=libqpsd-qt6
pkgver=2.3.0
pkgrel=1
pkgdesc='PSD & PSB Plugin for Qt/C++ (Qt6)'
arch=('x86_64')
url="https://github.com/roniemartinez/libqpsd"
license=('LGPL-2.1-only')
depends=('qt6-base')
#makedepends=('')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/roniemartinez/libqpsd/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a2eb23da9b502fadbf92231c3be5fa9090c489f31c60ea96f69a5f62aa681f06')

#/build/libqpsd-qt6/src
#total 8.0K
#drwxr-xr-x 2 builduser builduser 4.0K Sep 24 17:43 .
#drwxr-xr-x 3 builduser builduser 4.0K Sep 24 17:43 ..
#lrwxrwxrwx 1 builduser builduser   27 Sep 24 17:43 libqpsd-qt6-2.3.0 -> /startdir/libqpsd-qt6-2.3.0
#/startdir/PKGBUILD: line 18: cd: /build/libqpsd-qt6/src/libqpsd-qt6: No such file or directory


prepare() {
	pwd
	ls -lah "${srcdir}"

	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed -i "s|\$\$\[QT_INSTALL_PLUGINS\]|/usr/lib/qt/plugins|" QPsdPlugin.pro

	mkdir build
	cd build
	/usr/lib/qt6/bin/qmake ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"

	make INSTALL_ROOT="${pkgdir}" install
}
