# Maintainer: zilch40 <wlh233@live.com>
pkgname=rime-ls
pkgver=0.1.1
pkgrel=1
pkgdesc='A language server for Rime input method engine'
arch=(x86_64)
url='https://github.com/wlh320/rime-ls'
license=('BSD3')
makedepends=('clang')
depends=('librime')
sha512sums=('06674b8013312e30dcdbef27768e20903d2e86d6791a2b5b789c327a87a959d09673aa66ffdacd97e02d3b4c78f6a48f14c4504c8c226cd2a3bde68f52a1ab62')

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
    install -Dm755 "target/release/rime_ls" -t "$pkgdir"/usr/bin/rime_ls
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
