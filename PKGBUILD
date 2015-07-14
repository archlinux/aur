pkgname=apertium-eo-fr
pkgver=0.9.0
pkgrel=1
pkgdesc="Apertium language data for the Esperanto-French translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.0' 'apertium>=3.0')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch")
md5sums=('c3c4efa6e8faa990ae213a1707a1bd63'
         '74b0b10ddcc8bf3f64613dca3f2c34b0')

build() {
  patch -p0 < Makefile.am.patch

  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -i

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
