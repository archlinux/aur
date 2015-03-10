# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas

pkgname=ksysguard
pkgver=5.2.1
pkgrel=2
pkgdesc='KSysGuard'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/ksysguard'
license=('LGPL')
depends=('knewstuff' 'libksysguard' 'lm_sensors' 'xdg-utils'
         'hicolor-icon-theme' 'kdelibs4support')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kdebase-workspace')
groups=('plasma')
install="${pkgname}.install"
source=("http://download.kde.org/stable/plasma/${pkgver}/$pkgname-$pkgver.tar.xz"
        a148102e8ed56c7a8d0f790fad2f9366b27882d4.patch)
md5sums=('065e0efe3bd28f8e8565b109dc64f647'
         '8c12f14d885c4d59cb35c1b9e0281d5b')

prepare() {
  mkdir build

  # FS#44104
  cd $pkgname-$pkgver
  patch -p1 -i ../a148102e8ed56c7a8d0f790fad2f9366b27882d4.patch
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
