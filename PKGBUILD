# Maintainer: Elvis Angelaccio <elvis dot angelaccio at kdemail dot net>

pkgname=kronometer
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple chronometer application."
arch=('i686' 'x86_64')
url="http://aelog.org/kronometer"
license=('GPL2')
depends=('kconfig' 'kxmlgui' 'kwidgetsaddons')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kronometer-git')
install=$pkgname.install
source=(http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('9dbecf73b58b727039f8b82f2bffa171d9adf8c495804a8c925d2caacd5353fe')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
