# Maintainer: zilch40 <wlh233@live.com>
pkgname=rime-ls
pkgver=0.4.2
pkgrel=1
pkgdesc='A language server that provides input method functionality using librime'
arch=(x86_64)
url='https://github.com/wlh320/rime-ls'
license=('BSD3')
makedepends=('clang' 'cargo')
depends=('librime')
sha512sums=('8bddaae948458c19075c01774325d52a4873c368e5a66dbc026c3933ac324b7f04318aeb1c59d40dd461b48274d8e5bc5002738ecf1f19c6a7fe65a9346179cf')

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
