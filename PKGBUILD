# Maintainer: R. van Elst <https://raymii.org>

pkgname="simh-git"
pkgver=4.0.Beta.1.757.gff95fb8 
pkgrel=1
pkgdesc="The Computer History Simulation Project"
arch=('i686' 'x86_64')
url="http://simh.trailing-edge.com/"
license=('MIT')
depends=('libpcap' 'unzip')
makedepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/simh/simh.git')
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

build() {
  cd "${pkgname%-*}"
  make 
}

package() {
  cd "$srcdir/simh/BIN"
  for i in *; do
    install -D $i "$pkgdir/usr/bin/simh-$i"
  done

  cd "$srcdir/simh/VAX"
  mkdir -p "$pkgdir/usr/lib/simh"
  cp *.bin "$pkgdir/usr/lib/simh"
}


