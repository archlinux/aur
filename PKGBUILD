# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=libdeltachat
_srcname=deltachat-core-rust
pkgver=1.85.0
pkgrel=2
pkgdesc="Deltachat-core written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/deltachat/deltachat-core-rust/"
license=('MPL')
depends=('sqlcipher')
makedepends=('rust' 'cmake')
source=(
    "$pkgname-$pkgver::https://github.com/deltachat/deltachat-core-rust/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('77a53a256cf8fed54ac3c504f44cc5c61b57739b3dd35a42fc1adcd65e3b3c0e')

build() {
  cd "$srcdir/$_srcname-$pkgver"
  cmake -B build . -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
