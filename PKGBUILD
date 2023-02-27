# Maintainer: zilch40 <wlh233@live.com>
pkgname=rime-ls
pkgver=0.2.0
pkgrel=1
pkgdesc='A language server for Rime input method engine'
arch=(x86_64)
url='https://github.com/wlh320/rime-ls'
license=('BSD3')
makedepends=('clang')
depends=('librime')
sha512sums=('6e509af2db6d6a97c4ea4d1f3c2fffbc32aab6ebb671ecff971266d5b58e51df253fa9edf959bdbc0c0a9422474a6ee6358736ec0510146b3d39c6f0d689fc3e')

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
