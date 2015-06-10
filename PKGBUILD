# Contributor: Sergio Tridente <tioduke at gmail dot com>

_pkgname=onics
pkgname=onics-git
pkgver=507.9b6fb90
pkgrel=1
pkgdesc="A command line tool suite to capture, dissect, manipulate and send network data."
arch=('i686' 'x86_64')
url="https://gitorious.org/onics/pages/Home"
license=('GPL')
depends=('glibc' 'libpcap')
makedepends=('git' 'make')
conflicts=('onics')
provides=('onics')
source=('git://gitorious.org/catlib/catlib.git#branch=master'
        'git://gitorious.org/onics/onics.git#branch=master')
md5sums=('SKIP' 'SKIP')


pkgver() {
  cd "$srcdir/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  # Make catlib
  cd "$srcdir/catlib"
  make

  # Make ONICS
  cd "$srcdir/${_pkgname}"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make INSTALL_PREFIX=${pkgdir}/usr install

  # Move man pages to /usr/share
  mkdir -p "$pkgdir/usr/share"
  mv "$pkgdir/usr/man" "$pkgdir/usr/share"
}
