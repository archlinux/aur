# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>
pkgname=loop
pkgver=598ccc8
pkgrel=1
pkgdesc="UNIX's missing loop command"
arch=('any')
url="https://github.com/Miserlou/Loop"
license=('UNKNOWN')
provides=("loop")
makedepends=('cargo')
conflicts=('loop')
source=("$pkgname::git+https://github.com/Miserlou/Loop")
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
  install -Dm755 "target/release/loop" "$pkgdir/usr/bin/loop"
}

# vim:set ts=2 sw=2 et:
