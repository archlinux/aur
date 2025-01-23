# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nfacct-git
pkgver=1.0.2.r1.g430b60d
pkgrel=2
pkgdesc="Tool to create/retrieve/delete accounting objects"
arch=('i686' 'x86_64')
url="https://netfilter.org/projects/nfacct/index.html"
license=('GPL-2.0-or-later')
depends=('libmnl' 'libnetfilter_acct')
makedepends=('git')
provides=("nfacct=$pkgver")
conflicts=('nfacct')
source=("git+https://git.netfilter.org/nfacct")
sha256sums=('SKIP')


pkgver() {
  cd "nfacct"

  git describe --long --tags | sed 's/^nfacct-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "nfacct"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin"
  make
}

package() {
  cd "nfacct"

  make DESTDIR="$pkgdir" install
}
