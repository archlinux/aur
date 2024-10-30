# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=glues
pkgver=0.4.0
pkgrel=1
pkgdesc="Vim-inspired TUI note-taking app with Git, MongoDB support"
arch=('x86_64')
url="https://github.com/gluesql/glues"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('36492bb833d8ce46ab5845691d4b2614664e5adae10c58a4763fe0c20a9470944810c304a0128b03e6eb1518ee885ed20ab0544fdd13d0e1aea5cc63a4a1c62e')
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
