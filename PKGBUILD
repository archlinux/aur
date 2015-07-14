# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-en-es
pkgver=0.8.0
pkgrel=1
pkgdesc="Apertium language data for the English-Spanish translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.2' 'apertium>=3.2')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "configure.ac.patch"
	"Makefile.am.patch"
	"Makefile.in.patch")
md5sums=('4b82c32edbd5315432192799ed641930'
         '4968bf33612ae8fc3f0d253d81de2c4b'
         'dfae1753dac1a8720de76829a79c3401'
         'a93870ddb3343f9913582b44d2a70a12')
sha256sums=('b497b545982491d6e4c46b69e3167291bfdfae3d988917a996e5c44265f9fcdf'
            'f8345047daf60bf45f9218a551f4207c5b08ce8d318e1f5462909695e2151875'
            '35bd9284dcbbded62436f672fa32e5846b21897f23d526f90a1b53b5302e87c1'
            '1be3c6d97cfd3677df4e85742c3e199e512abf301411a5df05b9ff71b29c5e39')

build() {
  patch -p1 < configure.ac.patch
  patch -p1 < Makefile.am.patch
  patch -p1 < Makefile.in.patch

  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -fi

  ./configure --prefix=/usr
  make
}

package() {
  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
