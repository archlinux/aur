# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tcpdump-git
pkgver=4.9.0.r1079.g7f1d1729
pkgrel=1
pkgdesc="A powerful command-line packet analyzer"
arch=('i686' 'x86_64')
url="https://www.tcpdump.org/"
license=('BSD')
depends=('glibc' 'libcap-ng' 'libpcap' 'openssl')
makedepends=('git')
provides=('tcpdump')
conflicts=('tcpdump')
source=("git+https://github.com/the-tcpdump-group/tcpdump.git")
sha256sums=('SKIP')


pkgver() {
  cd "tcpdump"

  git describe --long --tags | sed 's/^tcpdump-//;s/-[a-z]*//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd "tcpdump"

  ./configure --prefix="/usr" --sbindir="/usr/bin"
  make
}

check() {
  cd "tcpdump"

  make tests
}

package() {
  cd "tcpdump"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/tcpdump/LICENSE"
}
