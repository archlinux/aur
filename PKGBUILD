# $Id: PKGBUILD 250341 2015-11-09 21:33:06Z arojas $
# Maintainer: maz-1 <ohmygod19993 at gmail dot com>

pkgname=kuser-frameworks
pkgver=16.08.3
pkgrel=1
pkgdesc='User Manager'
url='http://kde.org/applications/system/kuser/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kdeadmin')
depends=('kdelibs4support' 'kio' 'kldap')
makedepends=('cmake' 'automoc4' 'extra-cmake-modules' 'kdesignerplugin' 'kdoctools' 'kinit')
provides=(kdeadmin-kuser kuser)
conflicts=(kdeadmin-kuser kuser)
install=${pkgname%%-frameworks}.install
source=("https://download.kde.org/Attic/applications/${pkgver}/src/kuser-${pkgver}.tar.xz"
        "port_to_kf5.patch")
md5sums=('8a386e34875ba0966bb73a23b2180d44'
          'ff4a978c0e431b0582bd933640568cba')

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
