# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-ht-en
pkgver=0.1.0
pkgrel=1
pkgdesc="Apertium language data for the Haitian Creole-English translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.0' 'apertium>=3.0')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "Makefile.in.patch"
	"t1x.patch")
md5sums=('73d6dbbb2c1ad50b8e6c5428f4fc7a9e'
         'e99487bbc9df970596882bdc1b152218'
         '8625b7f9ee07b3696e71a49129db01fd'
         'b8f420edd5577fabef485dcb6d08a5e6')

build() {
  patch -p0 < Makefile.am.patch
  patch -p0 < Makefile.in.patch
  # remove the c (comment) attribute, not in the DTD in apertium<=3.1.1:
  patch -p0 < t1x.patch

  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}