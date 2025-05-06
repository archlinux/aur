# Maintainer: zilch40 <wlh233@live.com>
pkgname=rime-ls
pkgver=0.4.3
pkgrel=1
pkgdesc='A language server that provides input method functionality using librime'
arch=(x86_64)
url='https://github.com/wlh320/rime-ls'
license=('BSD3')
makedepends=('clang' 'cargo')
depends=('librime')
sha512sums=('6c379f9f418839281f15d47fc5a91ebc6358faa67b61b9ae840f3fb81ee502a613b27e74bf4bb30048ded78e01a06e3d5e72a94ca92abe80e256268b0a6cb7b5')

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
