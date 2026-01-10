pkgname=sax-git
pkgver=0
pkgrel=1
pkgdesc="Smart archiving and extracting utility"
arch=('x86_64')
url="https://github.com/rahmerh/sax"
license=('MIT')
depends=()
makedepends=('git' 'rust' 'cargo')

provides=('ax-git')
conflicts=('ax-git')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd sax
  git describe --long --tags --dirty 2>/dev/null \
    | sed 's/^v//; s/-/./g'
}

build() {
  cd sax
  cargo build --release --locked
}

package() {
  cd sax
  install -Dm755 target/release/sax "$pkgdir/usr/bin/sax"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

