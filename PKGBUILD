# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=librep
pkgver=0.92.6
pkgrel=1
pkgdesc="Lisp system for Sawfish"
license=('GPL2')
arch=('x86_64' 'i686')
url="http://sawfish.wikia.com/wiki/Librep"
depends=('gmp' 'gdbm' 'libffi')
options=('!emptydirs' '!libtool')
source=("http://download.tuxfamily.org/$pkgname/${pkgname}_${pkgver}.tar.xz")
sha256sums=('fec152d0aca9afeb71aed40e7e5af27ca7bd13a41aa493532108f6ef2b04cccc')

build() {
  cd "$srcdir"/${pkgname}_${pkgver}
  ./autogen.sh 
  ./configure --disable-static \
	      --prefix=/usr \
	      --libexecdir="/usr/lib/$pkgname" \
	      --with-readline \
	      --with-ffi
  make
}

package() {
  cd "$srcdir"/${pkgname}_${pkgver}
  make DESTDIR="$pkgdir" install
}

