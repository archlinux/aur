# Maintainer: Simon Pintarelli <simon.pintarelli@cscs.ch>
pkgname=costa
_pkgname=COSTA
pkgver=2.2.2
pkgrel=2
pkgdesc="Communication-optimal shuffle and transpose algorithms."
arch=(x86_64 aarch64)
url="https://github.com/eth-cscs/COSTA"
license=(BSD)
depends=(openmpi gcc-libs glibc scalapack)
makedepends=(cmake)
provides=(costa)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('e87bc37aad14ac0c5922237be5d5390145c9ac6aef0350ed17d86cb2d994e67c')

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake ../$_pkgname-$pkgver \
    -DBUILD_SHARED_LIBS=On \
    -DCOSTA_SCALAPACK=CUSTOM \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm755 ../$_pkgname-$pkgver/LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
