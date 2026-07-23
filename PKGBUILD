# Maintainer: Gur0v <thuggerthugger1@duck.com>
pkgname=spout-git
pkgver=r12.7cf4409
pkgrel=1
pkgdesc="The missing link between your screenshot tool and the internet (git version)"
arch=('x86_64')
url="https://github.com/Gur0v/spout"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=('spout')
conflicts=('spout')
source=("git+https://github.com/Gur0v/spout.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$srcdir/spout"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/spout"
  cargo build --release --locked
}

package() {
  cd "$srcdir/spout"
  install -Dm755 target/release/spout "$pkgdir/usr/bin/spout"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/spout/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/spout/README.md"
}
