# Mantainer maz-1 < ohmygod19993 at gmail dot com >
pkgname=polkit-kde-kcmodules-frameworks 
pkgver=20150815.g8d55dee
_revision=8d55deee00e385bad6897e470d7467f522db477c
pkgrel=1
pkgdesc="Set of configuration modules which allows administrator to change polkit settings."
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/base/polkit-kde-kcmodules-1'
license=('GPL')
provides=polkit-kde-kcmodules
conflicts=polkit-kde-kcmodules
depends=('kdelibs4support' 'polkit-qt5' 'kcmutils')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
source=("polkit-kde-kcmodules-1.tar.bz2::http://quickgit.kde.org/?p=polkit-kde-kcmodules-1.git&a=snapshot&h=$_revision&fmt=tbz2"
        "port_to_kf5.patch")
groups=('plasma')
md5sums=('12bc3bf887b2277bc39ce26031c2b63c'
         '85835fcd7d88a755ffe1be79b46183dd')


prepare() {
  mkdir -p build
  cd polkit-kde-kcmodules-1
  patch -p1 -i "$srcdir/port_to_kf5.patch"
}

build() {
  cd build
  cmake ../polkit-kde-kcmodules-1 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
