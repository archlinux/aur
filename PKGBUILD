# Maintainer: zilch40 <wlh233@live.com>
pkgname=rime-ls
pkgver=0.4.1
pkgrel=2
pkgdesc='A language server that provides input method functionality using librime'
arch=(x86_64)
url='https://github.com/wlh320/rime-ls'
license=('BSD3')
makedepends=('clang' 'cargo')
depends=('librime')
sha512sums=('c7b508a0a0313f1423fba24ece3b971cf6444a5934973b18d15e0669fe5ae2d609c49e2fe6548aa182b6dfb3aa1e780b2282da248b55e481806013027ce46aa9')

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
