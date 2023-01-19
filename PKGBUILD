# Maintainer: zilch40 <wlh233@live.com>
pkgname=rime-ls
pkgver=0.1.0
pkgrel=1
pkgdesc='A language server for Rime input method engine'
arch=(x86_64)
url='https://github.com/wlh320/rime-ls'
license=('BSD3')
makedepends=('clang')
depends=('librime')
sha512sums=('7521f12bac43b271bc309f72d503d6fccec262bafb128b50fad8b70779f74482d4c8c886eaa8d9b2dcae5f293ff9ce21eaf3975546c91f32cd214988cb40fcd2')

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
