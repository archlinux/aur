pkgname=onionloom-git
pkgver=r16.g11442fa
pkgrel=1
pkgdesc='fastest GPU-accelerated v3 vanity onion generator, built in Rust'
arch=('x86_64')
url='https://github.com/chrisch88dev/onionloom'
license=('Apache-2.0')
options=('!debug')
depends=('vulkan-headers')
makedepends=(
  'git'
  'rust'
  'cargo'
)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/onionloom"

  printf 'r%s.g%s\n' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/onionloom"
  cargo build --release --locked
}

package() {
  cd "$srcdir/onionloom"
  cargo install --locked --no-track --path . --root "$pkgdir/usr"
}
