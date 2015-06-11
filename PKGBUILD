# Maintainer: superlex

# Based on libdbusmenu-qt PKGBUILD:
# $Id: PKGBUILD 156245 2012-04-16 13:16:43Z andrea $
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libdbusmenu-qt-patched
_realname=libdbusmenu-qt
pkgver=0.9.2
pkgrel=4
pkgdesc="A library that provides a Qt implementation of the DBusMenu spec (patched for firefox globalmenu)"
arch=('i686' 'x86_64')
url="https://launchpad.net/libdbusmenu-qt"
license=('GPL')
depends=('qt4')
conflicts=("$_realname")
provides=("$_realname=$pkgver")
makedepends=('cmake' 'doxygen' 'qjson')
source=("http://launchpad.net/${_realname}/trunk/${pkgver}/+download/${_realname}-${pkgver}.tar.bz2"
                 "use-qx11info-apptime.patch")
md5sums=('9a49484927669cd2ec91b3bf9ba8b79e'
         '2a8562ab1fb703793d2c4183d61a4a00')

         
prepare() {
	# Patch: https://bugs.launchpad.net/libdbusmenu-qt/+bug/1035755
  	patch -Np1 -i "${srcdir}/use-qx11info-apptime.patch"
	mkdir build
}


build() {
	cd build
	cmake ../${_realname}-${pkgver} \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
