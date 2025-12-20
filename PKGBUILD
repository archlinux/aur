pkgname=git-context
pkgver=0.2.0
pkgrel=1
pkgdesc="Manage multiple Git repositories within a single working tree"
arch=('x86_64')
url="https://github.com/angelodibella/git-context"
license=('MIT')
depends=('gcc-libs')  # Rust binaries depend on this
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e6e889d5bd66f863bcbc680f5d06f53d9ed8c3dc7ca126ba317f5f3fea2f570f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/git-context" "$pkgdir/usr/bin/git-context"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
