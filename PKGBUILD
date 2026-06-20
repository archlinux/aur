pkgname=gitquarry
pkgver=0.1.10
pkgrel=1
pkgdesc="Terminal CLI for public GitHub repository search with explicit discovery controls"
arch=('x86_64' 'aarch64')
url="https://github.com/Microck/gitquarry"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-source.tar.gz")
sha256sums=('a731ebb6fa60db2f38bc4d8ff900fac6522c39fc35854a294ce1785e9a575909')

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
