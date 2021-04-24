# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>
pkgname=proverbilo
pkgver=46949d6
pkgrel=1
pkgdesc="Montras hazardajn proverbaojn kaj diraĵojn en terminalo."
arch=('any')
url="https://github.com/Fierthraix/proverbilo"
license=('GPL3')
provides=("proverbilo")
makedepends=('cargo')
conflicts=('proverbilo')
source=("$pkgname::git+https://github.com/Fierthraix/proverbilo")
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
  install -Dm755 "target/release/proverbilo" "$pkgdir/usr/bin/proverbilo"
}

# vim:set ts=2 sw=2 et:
