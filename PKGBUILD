# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-sv-da
pkgver=0.5.0
pkgrel=2
pkgdesc="Apertium language data for the Swedish-Danish translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig' 'autoconf')
depends=('lttoolbox>=3.0' 'apertium>=3.0')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "configure.ac.patch")
md5sums=('23d4247a7eb4835a096737a20251bc78'
         '276a049384b15d77c6b5164315b593e4'
         'ba12ab1b519a4853478cf27104639e23')

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