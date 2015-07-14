# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-oc-ca
pkgver=1.0.5
pkgrel=2
pkgdesc="Apertium language data for the Occitan-Catalan translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig' 'autoconf')
depends=('lttoolbox>=3.0' 'apertium>=3.0')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "configure.ac.patch"
        "ca-oc.t1x.patch"
        "oc-ca.t1x.patch")
md5sums=('902a96a35ae43d3f9437ae92f812459e'
         '38067f63d1bce99f424d3c49b86f2a6f'
         '3ade075d16b703044bde8bbd8d5d4ff3'
         '10de3a78ace592fd2d38dec074d3ec85'
         '4cd0d20adb084351c6ee04078c22fc25')

build() {
  patch -p0 < Makefile.am.patch
  patch -p0 < configure.ac.patch

  patch -p0 < ca-oc.t1x.patch # this didn't compile when it was released even...
  patch -p0 < oc-ca.t1x.patch

  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -i

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
