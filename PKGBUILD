# Maintainer: Mišo Barišić <me@misobarisic.com>
pkgname="targeter-git"
_pkgname="targeter"
pkgver=0.1.0.r0.ga7a2ce4
pkgrel=2
pkgdesc="Easily remove rust/cargo target directories"
arch=('x86_64')
url="https://github.com/misobarisic/targeter"
license=('GPL3')
makedepends=('cargo' 'rust')
conflicts=('targeter' 'targeter-bin')
provides=('targeter')
source=("targeter::git+https://github.com/misobarisic/targeter.git#branch=main")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release --features delay
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/bin"
  cp "target/release/targeter" "$pkgdir/usr/bin"
}
