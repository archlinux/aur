# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=pw-viz
pkgver=0.1.0
pkgrel=1
pkgdesc="Pipewire graph editor"
arch=('x86_64')
url="https://github.com/Ax9D/pw-viz"
license=('MIT')
depends=('pipewire' 'libxcb')
makedepends=('rust' 'clang')
source=($pkgname-$pkgver.tar.gz::https://github.com/Ax9D/pw-viz/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('7082325ce333c639bad08e93d9c4ba2e775a2efaaca7ece7262067d76ab4493a7312f748ab31bf56c21c3b1dfbf2a02ede44f3d69e6050bcb480d001890ce389')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/pw-viz "$pkgdir"/usr/bin/pw-viz
  # install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
