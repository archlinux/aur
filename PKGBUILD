# Maintainer: Cody P Schafer <archlinux at codyps.com>
_bpn=bustle-pcap
pkgname=${_bpn}-git
pkgver=0.5.4.r2.g0a426c3
pkgrel=2
pkgdesc="Capture traces for use in bustle"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/Bustle/"
license=('GPLv3')
groups=()
depends=(libdbus glib2 libpcap)
makedepends=(git pkg-config )
provides=(${_bpn})
conflicts=(${_bpn})
replaces=()
backup=()
options=(!emptydirs)
install=
source=($pkgname::git+https://anongit.freedesktop.org/git/bustle.git)
md5sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^bustle-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 dist/build/bustle-pcap ${pkgdir}/usr/bin/bustle-pcap
  install -Dm644 bustle-pcap.1 ${pkgdir}/usr/share/man/man1/bustle-pcap.1
}

# vim:set ts=2 sw=2 et:
