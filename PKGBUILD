# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=libdeltachat
_srcname=deltachat-core-rust
pkgver=1.131.8
pkgrel=2
pkgdesc="Deltachat-core written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/deltachat/deltachat-core-rust/"
license=('MPL')
depends=('sqlcipher')
options=(!lto)
makedepends=('rust' 'cmake')
source=(
    "$pkgname-$pkgver::https://github.com/deltachat/deltachat-core-rust/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('9349d71545fd76b45a131dfa35125604942330f1c95fdc2ceda94590ec2fb9b0')

build() {
  cd "$srcdir/$_srcname-$pkgver"
  cmake -B build . -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
