# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=pw-viz
pkgver=0.2.0
pkgrel=1
pkgdesc="Pipewire graph editor"
arch=('x86_64')
url="https://github.com/Ax9D/pw-viz"
license=('MIT')
depends=('pipewire' 'fontconfig')
makedepends=('rust' 'clang' 'cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/Ax9D/pw-viz/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('d14c7321963f0419354706c921e0b332f8ebcd842cc2cda60016ad74da473f37fd94846483fd97b47093bf4f35d77d5e677ff5e8e08d927a6fe82b5ff28b6e61')

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
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
