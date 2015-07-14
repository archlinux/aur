# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-eu-es
pkgver=0.3.1
pkgrel=2
pkgdesc="Apertium language data for the Basque-Spanish translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig' 'autoconf')
depends=('lttoolbox>=3.0' 'apertium>=3.0')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "configure.ac.patch")
md5sums=('990cbc06d639d7e1ecda0132405fe07a'
         '7ce5bc046e8b9d3b23134332fee6143c'
         '846c24b12b3528ae9e257b8d3c6796a8')

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