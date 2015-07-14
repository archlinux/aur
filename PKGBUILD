# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-en-ca
pkgver=0.9.3
pkgrel=1
pkgdesc="Apertium language data for the English-Catalan (including Valencian) translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.2' 'apertium>=3.2')
arch=('i686' 'x86_64')
source=("https://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
  "configure.ac.patch")
md5sums=('c984145a73c10c332c45b92bb676c37a'
         '69cf23698c83a2d4456a0b5c0f7d8a13')
sha256sums=('c56e1f1c3fece009dc7c6b68af70f04ca9fbdee8e4b5e2ed8ea603f2f22ef0d5'
            'f8e473ed4b180976d09a772f5d5f0827a019c4ad3ca420a818e38c9402da72e3')

build() {
  patch -p1 < configure.ac.patch

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
