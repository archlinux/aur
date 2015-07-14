# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-mk-bg
pkgver=0.2.0
pkgrel=1
pkgdesc="Apertium language data for the Macedonian-Bulgarian translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.2' 'apertium>=3.2' 'vislcg3>=0.9.7.6010')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "Makefile.in.patch")
md5sums=('a0f12e989097c67eb3d3a96e06a0fa38'
         'b66ee552f3e54e767c052cd36828e667'
         'cbe4d1dd0f37737b3aa98fdaa3770763')

build() {
  patch -p0 < Makefile.am.patch
  patch -p0 < Makefile.in.patch

  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"

  export PATH="/usr/bin:${PATH}" # override /usr/local/bin
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
