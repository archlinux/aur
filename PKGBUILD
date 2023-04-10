# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iperf3-git
pkgver=3.13.r5.g52b5cd1
pkgrel=1
pkgdesc="The ultimate speed test tool for TCP, UDP and SCTP"
arch=('i686' 'x86_64')
url="https://iperf.fr/"
license=('BSD' 'custom')
depends=('glibc' 'openssl')
makedepends=('git')
provides=("iperf3=$pkgver")
conflicts=('iperf3')
options=('staticlibs')
source=("git+https://github.com/esnet/iperf.git")
sha256sums=('SKIP')


pkgver() {
  cd "iperf"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "iperf"

  ./bootstrap.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "iperf"

  make check
}

package() {
  cd "iperf"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/iperf3"
}
