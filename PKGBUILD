# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnetfilter_conntrack-git
pkgver=1.0.6.r6.g2edc7cc
pkgrel=1
pkgdesc="Library providing access to the in-kernel connection tracking state table"
arch=('i686' 'x86_64')
url="https://netfilter.org/projects/libnetfilter_conntrack/index.html"
license=('GPL')
depends=('libnfnetlink' 'libmnl')
makedepends=('git')
provides=('libnetfilter_conntrack')
conflicts=('libnetfilter_conntrack')
source=("git://git.netfilter.org/libnetfilter_conntrack")
sha256sums=('SKIP')


pkgver() {
  cd "libnetfilter_conntrack"

  git describe --long --tags | sed 's/^libnetfilter_conntrack-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libnetfilter_conntrack"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "libnetfilter_conntrack"

  make DESTDIR="$pkgdir" install
}
