# $Id: PKGBUILD 250341 2015-11-09 21:33:06Z arojas $
# Maintainer: maz-1 <ohmygod19993 at gmail dot com>

pkgname=kuser-frameworks
pkgver=15.08.3
pkgrel=1
pkgdesc='User Manager'
url='http://kde.org/applications/system/kuser/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kdeadmin')
depends=('kdelibs4support' 'kio' 'kldap')
makedepends=('cmake' 'automoc4' 'extra-cmake-modules')
provides=(kdeadmin-kuser kuser)
conflicts=(kdeadmin-kuser kuser)
install=${pkgname%%-frameworks}.install
source=("http://download.kde.org/stable/applications/${pkgver}/src/kuser-${pkgver}.tar.xz" "port_to_kf5.patch")
sha1sums=('45a1ba4913e6dfe0104675151d81527f289703a8' 'SKIP')

prepare() {
  cd kuser-${pkgver}
  patch -p1 -i $srcdir/port_to_kf5.patch
}

build() {
  mkdir -p build
  cd build
  cmake ../kuser-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
