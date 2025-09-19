# Maintainer: dat
pkgname=yorsiur
pkgver=1.0.0
pkgrel=1
pkgdesc="YORSIUR - Your friend for Arch Linux"
arch=('x86_64')
url="https://github.com/datuns/yorsiur"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/datuns/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4abe948d69fe4ae080f1efe6cf64e684963d4daa32a8e30e507f6bddc45bdd20')

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
  
  install -Dm644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}