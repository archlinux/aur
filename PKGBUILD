# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>
pkgname=rmatrix
pkgver=3738314
pkgrel=1
pkgdesc="Rust port of a curses-based 'Matrix'-like screen"
arch=('any')
url="https://github.com/Fierthraix/rmatrix"
license=('GPL3')
provides=("rmatrix")
makedepends=('cargo')
conflicts=('rmatrix')
source=("$pkgname::git+https://github.com/Fierthraix/rmatrix")
sha1sums=('SKIP')

build() {
  cd "$pkgname"
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run stable \
      cargo build --release
  elif rustc --version | grep -q nightly; then
    RUSTFLAGS="-C target-cpu=native" \
      cargo build --release
  else
    cargo build --release
  fi
}

pkgver() {
  cd "$pkgname"
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/rmatrix" "$pkgdir/usr/bin/rmatrix"
}

# vim:set ts=2 sw=2 et:
