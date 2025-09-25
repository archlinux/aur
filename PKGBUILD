# Maintainer: objz <me@objz.dev>
pkgname=genv-git
pkgver=f4711b3
pkgrel=1
pkgdesc="Portable environment variable manager"
arch=('x86_64' 'aarch64')
url="https://github.com/objz/genv"
license=('GPL3')
depends=()
makedepends=('git' 'rust' 'cargo')
provides=('genv')
conflicts=('genv')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/genv"
  git describe --tags --long --always 2>/dev/null | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "$srcdir/genv"
  cargo build --release --locked
}

check() {
  cd "$srcdir/genv"
  cargo test --release --no-run || true
}

package() {
  cd "$srcdir/genv"
  install -Dm755 "target/release/genv" "$pkgdir/usr/bin/genv"
  install -Dm644 README.md "$pkgdir/usr/share/doc/genv/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/genv/LICENSE"
}
