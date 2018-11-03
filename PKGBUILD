# $Id$
# Maintainer: Ian Schoonover <schoonover DOT ian AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Hussam Al-Tayeb <ht990332@gmail.com>

pkgname=libhunspell1.3
pkgver=1.3.2
pkgrel=1
pkgdesc="Only the libraries provided by hunspell, the spell checker and morphological analyzer"
arch=('i686' 'x86_64')
url="http://hunspell.sourceforge.net/"
license=('GPL' 'LGPL' 'MPL')
depends=('gcc-libs' 'readline')
optdepends=('perl: for ispellaff2myspell')
source=(http://downloads.sourceforge.net/hunspell/hunspell-$pkgver.tar.gz)
md5sums=('3121aaf3e13e5d88dfff13fb4a5f1ab8')

build() {
  cd "$srcdir/hunspell-$pkgver"
  ./configure --prefix=/usr --disable-static \
 --with-ui --with-readline --with-experimental
  make
}

package() {
  cd "$srcdir/hunspell-$pkgver"
  make DESTDIR="$pkgdir" install

  # delete everything but libraries
  rm -rf ${pkgdir}/usr/{bin,include,share}
  rm -rf ${pkgdir}/usr/lib/pkgconfig
}

