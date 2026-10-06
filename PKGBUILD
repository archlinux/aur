# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>
#
# Standalone Lift release; versioned independently of the Halley compositor.

pkgname=halley-lift
pkgver=0.3.0
pkgrel=1
pkgdesc="Search and action launcher for the Halley Wayland compositor"
arch=('x86_64')
url="https://github.com/saltnpepper97/halley-lift"
license=('GPL-3.0-only')
depends=('wayland' 'libxkbcommon' 'fontconfig')
makedepends=('cargo' 'rust' 'pkgconf')
optdepends=('halley: the Halley compositor this launcher controls via IPC')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('11108c58c715d468c3a9ba67c9b929b9efa4069f12a3ddb7d1594590afa6b219')

_srcdir="$pkgname-$pkgver"

build() {
  cd "$srcdir/$_srcdir"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p halley-lift
}

check() {
  cd "$srcdir/$_srcdir"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$_srcdir"

  install -Dm755 "target/release/halley-lift" \
    "$pkgdir/usr/bin/halley-lift"

  install -Dm644 "README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "examples/lift.rune" \
    "$pkgdir/usr/share/doc/$pkgname/lift.rune"

  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
