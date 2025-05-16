# Maintainer: Alex Ngugi <ngugialex540@gmail.com>

pkgname=synx
pkgver=0.2.1
pkgrel=1
pkgdesc="A CLI-first universal syntax validator and linter dispatcher"
arch=('x86_64')
url="https://github.com/A5873/synx"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dab3607571aa0ccc84d7b704d9456ddd87871859ada69e63619ef1446881826c')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
