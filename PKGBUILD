# Creator: aksr <aksr at t-com dot me>
# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
pkgname=skalibs-git
pkgver=2.16.0.0.r2.g4fbc763
pkgrel=1
pkgdesc="A general-purpose low-level C library."
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
makedepends=('git')
provides=('skalibs')
conflicts=('skalibs')
source=("$pkgname::git+git://git.skarnet.org/skalibs")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --datadir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
