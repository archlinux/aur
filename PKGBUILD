pkgname=gitquarry
pkgver=0.1.9
pkgrel=1
pkgdesc="Terminal CLI for public GitHub repository search with explicit discovery controls"
arch=('x86_64' 'aarch64')
url="https://github.com/Microck/gitquarry"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-source.tar.gz")
sha256sums=('d121f5ac20a9c07ba14896d7cab71ed6ca7bada702b2fbb0ee5502bdaaebe9a1')

prepare() {
  cd "$srcdir"
  cargo fetch --locked
}

build() {
  cd "$srcdir"
  cargo build --frozen --release
}

check() {
  cd "$srcdir"
  cargo test --frozen --locked
}

package() {
  cd "$srcdir"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
