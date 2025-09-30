# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=glues
pkgver=0.8.1
pkgrel=1
pkgdesc="Vim-inspired TUI note-taking app with Git, MongoDB support"
arch=('x86_64')
url="https://github.com/gluesql/glues"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fbe446ae78b100dc5cf7ed77afe34d9229e34a084d4389e5296cf4a11bb81a3bde73c1f8638e0463c77b094a21b0ab189ea08775926f881e80a04d8c02368434')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release # --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test # --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
