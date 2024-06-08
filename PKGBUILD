# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=pw-viz
pkgver=0.3.0
pkgrel=1
pkgdesc="Pipewire graph editor"
arch=('x86_64')
url="https://github.com/Ax9D/pw-viz"
license=('MIT')
depends=('pipewire' 'fontconfig')
makedepends=('rust' 'clang' 'cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/Ax9D/pw-viz/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('f134b704333e0a8fe4236d0a59f60700da0f0cc6aa532506c55422f77261a8e228621803e70c84747d07b0a0608e3116c2dcb1690b67b0357cd105368ace154d')

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
