# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-en-gl
pkgver=0.5.1
pkgrel=2
pkgdesc="Apertium language data for the English-Galician translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig' 'autoconf')
depends=('lttoolbox>=3.0' 'apertium>=3.0')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "configure.ac.patch")
md5sums=('daaba4c47ed5cbfbdd9c9410044ffa31'
         '106b362aa9693eee1c94c55f0f00fa33'
         '0040d866c8c2baed89a744c699e0179d')

build() {
  patch -p0 < Makefile.am.patch
  patch -p0 < configure.ac.patch

  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -i

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
