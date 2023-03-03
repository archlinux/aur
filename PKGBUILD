# Maintainer: zilch40 <wlh233@live.com>
pkgname=rime-ls
pkgver=0.2.1
pkgrel=1
pkgdesc='A language server for Rime input method engine'
arch=(x86_64)
url='https://github.com/wlh320/rime-ls'
license=('BSD3')
makedepends=('clang')
depends=('librime')
sha512sums=('2e915ba16430606f88a24642344e74ccc0ef08a529cb8e2a8eceea82119966403524ad9c3a9f1e56726895cfd0f1730ceb3f73b7925c68e711ebdcd026ee254e')

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
