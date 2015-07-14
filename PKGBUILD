# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-is-en
pkgver=0.1.0
pkgrel=1
pkgdesc="Apertium language data for the Icelandic-English translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.2.0' 'apertium>=3.2.0' 'vislcg3>=0.9.7.6010')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "Makefile.in.patch")
md5sums=('a53f884fc72d69de1e57b56581258978'
         '9b49f260b71cbd2a68b46d99e01248fe'
         'a3974fcdb318c511a0624be504558601')


build() {
  patch -p0 < Makefile.am.patch
  patch -p0 < Makefile.in.patch

  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}