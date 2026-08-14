pkgname=gitquarry
pkgver=0.2.0
pkgrel=1
pkgdesc="Terminal CLI for public GitHub repository search with explicit discovery controls"
arch=('x86_64' 'aarch64')
url="https://github.com/Microck/gitquarry"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-source.tar.gz")
sha256sums=('b2a66a84f317969ec2e812164b7e8cc885f115759c83b57ee9ae97ad86ebf9fd')

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
