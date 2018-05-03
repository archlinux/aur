# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnetfilter_acct-git
pkgver=1.0.3.r0.gf9529e2
pkgrel=1
pkgdesc="Userspace library providing interface to extended accounting infrastructure"
arch=('i686' 'x86_64')
url="https://netfilter.org/projects/libnetfilter_acct/index.html"
license=('LGPL')
depends=('glibc' 'libmnl')
makedepends=('git')
provides=('libnetfilter_acct')
conflicts=('libnetfilter_acct')
source=("git://git.netfilter.org/libnetfilter_acct")
sha256sums=('SKIP')


pkgver() {
  cd "libnetfilter_acct"

  git describe --long --tags | sed 's/^libnetfilter_acct-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libnetfilter_acct"

  autoreconf -fi
  ./configure --prefix="/usr"
  make
}

package() {
  cd "libnetfilter_acct"

  make DESTDIR="$pkgdir" install
}
