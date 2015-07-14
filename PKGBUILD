# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-pt-gl
pkgver=0.9.1
pkgrel=2
pkgdesc="Apertium language data for the Portuguese-Galician translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig' 'autoconf')
depends=('lttoolbox>=3.0' 'apertium>=3.0')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "configure.ac.patch")
md5sums=('3629d1967374f76d51ad58de24d65875'
         'a00fb565b4270a3864f39cadcf2c1831'
         'de1df1d4a94d1852c584b8de14207168')

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
