# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=glues
pkgver=0.5.0
pkgrel=1
pkgdesc="Vim-inspired TUI note-taking app with Git, MongoDB support"
arch=('x86_64')
url="https://github.com/gluesql/glues"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('32e8e3ed6e5e29f2421e0ceeecc01925bea8596cefc80a1e0ca3490272097aea24b8aa6bb77100472fc2504e7a3af998332e42178ac3f34dd8a84ccefa86e927')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
