# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-fr-es
pkgver=0.9.2
pkgrel=1
pkgdesc="Apertium language data for the French-Spanish translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig' 'autoconf')
depends=('lttoolbox>=3.2.0' 'apertium>=3.2.0')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch")
md5sums=('0b04ee8f1694f95adafb2589c802829e'
         '0020317ca43e1b16f6584d7365351df0')

build() {
  patch -p0 < Makefile.am.patch

  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -i	      # or we could patch the huge configure script...

  export PATH="/usr/bin:${PATH}" # override /usr/local/bin
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}