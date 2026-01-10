pkgname=ax-git
pkgver=0
pkgrel=1
pkgdesc="Smart archiving and extracting utility"
arch=('x86_64')
url="https://github.com/rahmerh/ax"
license=('MIT')
depends=()
makedepends=('git' 'rust' 'cargo')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ax
  git describe --long --tags --dirty 2>/dev/null \
    | sed 's/^v//; s/-/./g'
}

build() {
  cd ax
  cargo build --release --locked
}

package() {
  cd ax
  install -Dm755 target/release/ax "$pkgdir/usr/bin/ax"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
