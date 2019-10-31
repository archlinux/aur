# Maintainer: Nihilazo <nihilazo at protonmail dot com>
pkgname=plptools-git
gitname="plptools"
pkgrel=2
pkgdesc="Utilities for communication with EPOC PDAs, e.g. mounting via FUSE"
pkgver=rel.1.0.12.r51.g56dc15d
arch=('i686' 'x86_64')
url="https://github.com/rrthomas/plptools"
license=('GPL2')
depends=('fuse')
source=(plptools::git+https://github.com/rrthomas/plptools)
makedepends=('git' 'make' 'automake')
md5sums=(SKIP)

pkgver() {
  cd "$gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$gitname"
}

build() {
  cd "$srcdir/$gitname"
  autoreconf -i
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$gitname"
  make DESTDIR="$pkgdir/" install
}
