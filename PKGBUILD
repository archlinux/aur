pkgname=code-weaver
_reponame=CodeWeaver
pkgver=0.1.5
pkgrel=1
pkgdesc="A tool to weave context for AI"
arch=("x86_64")
license=("MIT")
url="https://github.com/SaintFore/CodeWeaver"
depends=("gcc-libs")
makedepends=("rust")

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6253b78231cfa4dcfc9a4e3b4389c8f0f1a86397df03d52ecf2f4b574fe48bcc')

prepare() {
  cd "$_reponame-$pkgver" || return
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_reponame-$pkgver" || return
  cargo build --release
}

package() {
  cd "$_reponame-$pkgver" || return
  install -Dm755 "target/release/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
