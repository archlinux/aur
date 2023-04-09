# Maintainer: zilch40 <wlh233@live.com>
pkgname=rime-ls
pkgver=0.2.3
pkgrel=2
pkgdesc='A language server for Rime input method engine'
arch=(x86_64)
url='https://github.com/wlh320/rime-ls'
license=('BSD3')
makedepends=('clang' 'cargo')
depends=('librime')
sha512sums=('55d5aa1097c8f5af349ec8e22d16b561e1b3c870b7fbb3a02df78bfe9f6e31d469898dd351013c804c2d6d5b4a82ddb89920e7b954b83ed31f31694f8a67662e')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/rime_ls" -t "$pkgdir"/usr/bin
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
