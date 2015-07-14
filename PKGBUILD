# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-oc-es
pkgver=1.0.5
pkgrel=1
pkgdesc="Apertium language data for the Occitan-Spanish translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.0' 'apertium>=3.0')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "configure.ac.patch"
        "oc-es.t1x.patch"
        "es-oc.t1x.patch")
md5sums=('c3d7f9d2c5b0ee050e7219ea590c019e'
         'a5f5705c9de36ec1ec46ab31bf148b3e'
         '26cc63e7e3e830a5f6fd76590f5e22de'
         'a65e5c80e5cec7490665dd4a3a232fe7'
         'd41d8cd98f00b204e9800998ecf8427e')

build() {
  patch -p0 < Makefile.am.patch
  patch -p0 < configure.ac.patch
  patch -p0 < oc-es.t1x.patch
  patch -p0 < es-oc.t1x.patch

  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -i

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
