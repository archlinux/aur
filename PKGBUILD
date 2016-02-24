# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=mininim
pkgver=0.9.2
pkgrel=1
pkgdesc="the Advanced Prince of Persia Engine, based on 1989 release"
arch=('i686' 'x86_64')
url="https://oitofelix.github.io/mininim/"
license=('GPL3')
depends=('allegro')
source=(http://oitofelix.github.io/mininim/mininim-$pkgver.tar.gz)
md5sums=('6610788d3a235159af7f389985c448fd')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|"${pkgdatadir}"|"$(DESTDIR)${pkgdatadir}"|g' Make*
  cd doc
  sed -i 's|"${infodir}"|"$(DESTDIR)$(infodir)"|g' Make*
}

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
