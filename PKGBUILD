# Maintainer: a821 mail de
# Contributor: Máté Eckl <ecklm94@gmail.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libnftnl-git
pkgver=1.2.2.r1.g84d12cf
pkgrel=1
pkgdesc='Netfilter library providing interface to the nf_tables subsystem'
arch=('x86_64')
url='https://netfilter.org/projects/libnftnl/'
license=(GPL2)
depends=('libmnl')
makedepends=('git')
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

# vim: set ts=2 sw=2 et:
