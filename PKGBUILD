# Maintainer: zilch40 <wlh233@live.com>
pkgname=rime-ls
pkgver=0.1.2
pkgrel=1
pkgdesc='A language server for Rime input method engine'
arch=(x86_64)
url='https://github.com/wlh320/rime-ls'
license=('BSD3')
makedepends=('clang')
depends=('librime')
sha512sums=('5e127da44799a495127c6f6b7b215e4e1cccf53c0367608ec9c021a2620778547d5f94ce64584b1412d95acabe9ef55534ead73a67ed74c88460d3c377b1b7f0')

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
