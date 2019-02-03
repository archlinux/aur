# Maintainer: David Flemström <david.flemstrom@gmail.com>
pkgname=record-query-git
pkgver=v0.10.4.r50.gd84d4d8
pkgrel=1
epoch=
pkgdesc="A tool for doing record analysis and transformation"
arch=('x86_64')
url="https://github.com/dflemstr/rq"
license=('Apache')
groups=()
depends=(gcc-libs)
makedepends=(cargo clang git rust wget)
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
  https://s3-eu-west-1.amazonaws.com/record-query/v8/x86_64-unknown-linux-gnu/5.7.441.1/v8-build.tar.gz
)
noextract=()
md5sums=(
  SKIP
  134eb4e842a26f193ae5532d6cd4960a
)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export V8_LIBS=$srcdir/v8-build/lib/libv8uber.a
  export V8_SOURCE=$srcdir/v8-build
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
