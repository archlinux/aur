# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tcpreplay-git
pkgver=4.4.3.r0.gbcb107a7
pkgrel=1
pkgdesc="Pcap editing and replaying utilities"
arch=('i686' 'x86_64')
url="https://tcpreplay.appneta.com/"
license=('GPL3')
depends=('libdnet' 'libpcap')
makedepends=('git' 'autogen' 'tcpdump')
provides=("tcpreplay=$pkgver")
conflicts=('tcpreplay')
source=("git+https://github.com/appneta/tcpreplay.git")
sha256sums=('SKIP')


pkgver() {
  cd "tcpreplay"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "tcpreplay"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --with-tcpdump=/usr/bin/tcpdump \
    ac_cv_header_net_bpf_h=n
  make
}

check() {
  cd "tcpreplay"

  #make test
}

package() {
  cd "tcpreplay"

  make DESTDIR="$pkgdir" install
}
