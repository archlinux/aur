# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=librep
pkgver=0.92.7
pkgrel=1
pkgdesc="Lisp system for Sawfish"
license=('GPL2')
arch=('x86_64' 'i686')
url="http://sawfish.wikia.com/wiki/Librep"
depends=('gmp' 'gdbm' 'libffi')
options=('!emptydirs' '!libtool')
source=("http://download.tuxfamily.org/$pkgname/${pkgname}_${pkgver}.tar.xz")
sha256sums=('48a19679ac7c0530a89657de18ffe49c5759a5ff70fc844928b0e5d00395acae')

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

