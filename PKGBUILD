# Maintainer: Siddhesh Lakhani lakhani.siddhesh@gmail.com 
pkgname=pico-color-picker
pkgver=1.0.2
pkgrel=1
pkgdesc="Minimal X11 color picker with clipboard support"
arch=('x86_64')
url="https://github.com/sid-lakhani/pico"
license=('MIT')
depends=('xclip' 'libx11')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "pico-$pkgver"
  cargo build --release --locked
}

package() {
  cd "pico-$pkgver"
  install -Dm755 target/release/pico "$pkgdir/usr/bin/pico"

  # symlinks
  ln -s /usr/bin/pico "$pkgdir/usr/bin/pico-rgb"
  ln -s /usr/bin/pico "$pkgdir/usr/bin/pico-rgba"
  ln -s /usr/bin/pico "$pkgdir/usr/bin/pico-hsl"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

