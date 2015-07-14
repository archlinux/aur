# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-es-gl
pkgver=1.0.7
pkgrel=2
pkgdesc="Apertium language data for the Spanish-Galician translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.0' 'apertium>=3.0')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "configure.ac.patch")
md5sums=('17e5dd2df012f8848479ed9205d9248c'
         'b60a40523e1104ed8ce1d03bd8c9f54d'
         'b3c34766a80291fb1bbb221d8b93cf18')

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