# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libpcap-git
pkgver=1.10.0.bp.r15.ge13fde1e
pkgrel=1
pkgdesc="A portable C/C++ library for network traffic capture"
arch=('i686' 'x86_64')
url="https://www.tcpdump.org/"
license=('BSD')
depends=('glibc' 'dbus' 'libnl')
makedepends=('git' 'bluez-libs')
provides=('libpcap' 'libpcap.so')
conflicts=('libpcap')
options=('staticlibs')
source=("git+https://github.com/the-tcpdump-group/libpcap.git")
sha256sums=('SKIP')


pkgver() {
  cd "libpcap"

  git describe --long --tags | sed 's/^libpcap-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libpcap"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libpcap"

  make tests
}

package() {
  cd "libpcap"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libpcap"
}
