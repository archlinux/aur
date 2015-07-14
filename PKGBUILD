# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-eo-en
pkgver=1.0.0
pkgrel=1
pkgdesc="Apertium language data for the Esperanto-English translator."
url="http://apertium.org"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.0' 'apertium>=3.0')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
        "Makefile.am.patch"
        "Makefile.in.patch")
md5sums=('df00059573f4a87d90dc56394daf6793'
         '31dfb82e3412a1159786ce65a2748910'
         '6145fc4ec2ceddd7270fa2111d11bb73')

build() {
  patch -p0 < Makefile.am.patch
  patch -p0 < Makefile.in.patch

  mkdir -p "$pkgdir/usr/share/apertium/modes"

  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}