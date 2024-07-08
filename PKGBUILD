# Maintainer: wyzdwdz <wyzdwdz@gmail.com>
pkgname="udpreplay-skasa-git"
pkgver=r89.227666c
pkgrel=1
pkgdesc="a tool to replays UDP packets from a pcap dump"
arch=("x86_64")
url="https://github.com/ska-sa/udpreplay"
license=("GPL-3.0-or-later")
depends=("libpcap" "boost-libs")
makedepends=("boost")
conflicts=("udpreplay")
source=("udpreplay-skasa::git+https://github.com/ska-sa/udpreplay.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/udpreplay-skasa"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/udpreplay-skasa"
  ./bootstrap.sh
  ./configure --prefix='/usr'
  make
}

package() {
  cd "$srcdir/udpreplay-skasa"
  DESTDIR="$pkgdir" make install
}
