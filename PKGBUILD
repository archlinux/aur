# Maintainer: Ted Pinkerton <p_t@fastmail.net>
pkgname=markcat
pkgver=1.1.3
pkgrel=2
pkgdesc="Convert a project directory to markdown"
arch=('x86_64')
url="https://github.com/RunnersNum40/markcat"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+https://github.com/RunnersNum40/markcat.git#tag=v$pkgver")
sha256sums=('SKIP')
options=('!debug')

prepare() {
  cd "$srcdir/$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
