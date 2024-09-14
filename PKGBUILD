# Maintainer: zilch40 <wlh233@live.com>
pkgname=rime-ls
pkgver=0.4.0
pkgrel=1
pkgdesc='A language server for Rime input method engine'
arch=(x86_64)
url='https://github.com/wlh320/rime-ls'
license=('BSD3')
makedepends=('clang' 'cargo')
depends=('librime')
sha512sums=('4cc382ad6f4b8b02bfd155f8b38f20e99d74dfa50838d07206dfaae11d082862b86030e2a2fb692c7bbd4435d3248e867f47e3128819c2979c31928d77b1d01e')

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
