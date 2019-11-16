# Maintainer: David Flemström <david.flemstrom@gmail.com>
pkgname=record-query-git
pkgver=v1.0.0.r1.g594d6a9
pkgrel=1
epoch=
pkgdesc="A tool for doing record analysis and transformation"
arch=('x86_64')
url="https://github.com/dflemstr/rq"
license=('Apache')
groups=()
depends=(gcc-libs)
makedepends=(cargo git rust)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  $pkgname::git+https://github.com/dflemstr/rq.git
)
noextract=()
md5sums=(
  SKIP
)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

check() {
  cd "$srcdir/$pkgname"
  cargo test
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  install -m755 target/release/rq -t "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
