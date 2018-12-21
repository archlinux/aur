# Maintainer: Máté Eckl <ecklm94@gmail.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libnftnl-git
pkgver=1.1.2
pkgrel=1
pkgdesc='Netfilter nf_tables infrastructure library that provides low level API for nftables to transform netlink messages to objects.'
arch=(i686 x86_64)
url='https://netfilter.org/projects/libnftnl/'
license=(GPL2)
depends=(libmnl)
makedepends=(git make gcc autoconf)
provides=(libnftnl)
conflicts=(libnftnl)
source=(git://git.netfilter.org/libnftnl)
sha1sums=('SKIP')

pkgver() {
  cd libnftnl
  git describe | sed 's/^libnftnl-//; s/-/.r/; s/-/./'
}

build() {
  cd libnftnl
  sh autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd libnftnl
  make check
}

package() {
  cd libnftnl
  make DESTDIR="$pkgdir" install
}
