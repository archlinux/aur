# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Ravi Desai <ravster3@hotmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xfe
pkgver=1.42
pkgrel=3
pkgdesc="X File Explorer (Xfe) is an MS-Explorer like file manager for X."
arch=('x86_64')
url="http://roland65.free.fr/xfe"
license=('GPL')
depends=('fox>=1:1.6' 'fox<1:1.7' 'freetype2')
makedepends=('intltool')
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz no_freetype_check.patch)
sha256sums=('a1e3e892584988c80b3a492f7b3cb78e1ee84d7148e6d1fc9d6054bbd8063bec'
            '8a7acd26ae612ea02aa00c6cb12763e04b3c17e9c8782d64b76930718a19c92b')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/no_freetype_check.patch 
}

build() {
  cd $pkgname-$pkgver
  ./autogen.sh 
  ./configure --prefix=/usr 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
