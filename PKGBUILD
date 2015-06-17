# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=iptables-nftables-git
pkgver=1.4.15.r261.ge2f019a
pkgrel=1
pkgdesc='backward compatibility iptables/ip6tables user-space utility'
arch=(i686 x86_64)
url='http://netfilter.org/projects/nftables/'
license=(GPL2)
makedepends=(git)
provides=(iptables)
conflicts=(iptables iptables-nftables)
source=(git://git.netfilter.org/iptables-nftables)
sha1sums=('SKIP')

pkgver() {
  cd iptables-nftables
  git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd iptables-nftables
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd iptables-nftables
  make DESTDIR="$pkgdir" install
}
