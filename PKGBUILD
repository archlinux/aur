# Maintainer: zilch40 <wlh233@live.com>
pkgname=rime-ls
pkgver=0.4.1
pkgrel=1
pkgdesc='A language server that provides input method functionality using librime'
arch=(x86_64)
url='https://github.com/wlh320/rime-ls'
license=('BSD3')
makedepends=('clang' 'cargo')
depends=('librime')
sha512sums=('615127eaaa8bf14c55ae1ea87330dd895e21612cf4fc555640d196419131f2319df8fdae27428039f1784d682764064479f288717a0828f4a65eefbc73cff078')

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
