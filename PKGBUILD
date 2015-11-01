# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=librep
pkgver=0.92.5
pkgrel=1
pkgdesc="Lisp system for Sawfish"
license=('GPL2')
arch=('x86_64' 'i686')
url="http://sawfish.wikia.com/wiki/Librep"
depends=('gmp' 'gdbm' 'libffi')
install=$pkgname.install
options=('!emptydirs' '!libtool')
source=("http://download.tuxfamily.org/$pkgname/${pkgname}_${pkgver}.tar.xz" fcons.patch)
sha256sums=('22da9bab38d161309a593c36f2168fb78de8a8a93f171f08dee5ef89e22b5e7f'
            '7279a87c34ad518732889d4ad450f0c7e2b35e6e93239df1ead9fa157e1b1b35')

prepare() {
  cd "$srcdir"/${pkgname}_${pkgver}
  patch -Np1 < $srcdir/fcons.patch
}

build() {
  cd "$srcdir"/${pkgname}_${pkgver}
  CC=gcc ./configure --disable-static --prefix=/usr --libexecdir="/usr/lib/$pkgname" \
    --with-readline
  make
}

package() {
  cd "$srcdir"/${pkgname}_${pkgver}
  make DESTDIR="$pkgdir" install
}

