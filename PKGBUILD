# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-es-ro
pkgver=0.7.1
pkgrel=1
pkgdesc="Apertium language data for the Spanish-Romanian translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig' 'autoconf')
depends=('lttoolbox>=3.0' 'apertium>=3.0')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "configure.ac.patch"
        "trules.patch")
md5sums=('9de6e21ddf8dfb65a6b09b430e8ab600'
         'e0d964dad84346f98b500505d428b687'
         'f4067b2a28d94dc08feff01a41f2d107'
         '0a6caa9170cca54ba1146803e6cdb1e6')

build() {
  patch -p0 < Makefile.am.patch
  patch -p0 < configure.ac.patch
  patch -p0 < trules.patch

  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -i

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
