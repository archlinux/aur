# Maintainer: Ted Pinkerton <p_t@fastmail.net>
pkgname=markcat
pkgver=1.1.1
pkgrel=1
pkgdesc="Convert a project directory to markdown"
arch=('x86_64')
url="https://github.com/RunnersNum40/markcat"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+https://github.com/RunnersNum40/markcat.git#tag=v$pkgver")
sha256sums=('SKIP')
options=('!debug')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname"
  cargo test --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
