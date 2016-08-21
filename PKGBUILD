# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinuxo.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=cervisia
pkgver=16.08.0
pkgrel=1
pkgdesc='CVS Frontend'
url='http://kde.org/applications/development/cervisia/'
arch=(i686 x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kdesdk)
depends=(kdesu kparts hicolor-icon-theme)
makedepends=(extra-cmake-modules python kdoctools)
conflicts=(kdesdk-cervisia)
replaces=(kdesdk-cervisia)
source=("http://download.kde.org/stable/applications/$pkgver/src/$pkgname-$pkgver.tar.xz")
sha1sums=('c779b55a42887ba7b8dc624b8a0673712d5cf1c9')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
