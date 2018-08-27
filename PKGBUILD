# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libpcap-git
pkgver=1.8.1.r205.g69fcdc66
pkgrel=1
pkgdesc="A portable C/C++ library for network traffic capture"
arch=('i686' 'x86_64')
url="https://www.tcpdump.org/"
license=('BSD')
depends=('glibc' 'libnl' 'libusbx' 'dbus')
makedepends=('git' 'bluez-libs')
provides=('libpcap')
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

  ./configure --prefix="/usr"
  make
}

check() {
  cd "libpcap"

  make tests
}

package() {
  cd "libpcap"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/libpcap/LICENSE"
}
