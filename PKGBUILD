# Maintainer: toxdes <hi@toxdes.com>
pkgname=mousr-git
pkgver=0.1.7
pkgrel=1
pkgdesc="Keyboard-driven mouse control for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/mousr"
license=('MIT')
depends=('wayland' 'libxkbcommon')
makedepends=('git' 'rust' 'pkgconf')
source=('git+https://github.com/toxdes/mousr.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mousr"
  git describe --long --tags --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/mousr"
  cargo build --release --locked
}

package() {
  cd "$srcdir/mousr"
  install -Dm755 target/release/mousr "$pkgdir/usr/bin/mousr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
