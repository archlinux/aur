# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=mininim
pkgver=0.10
pkgrel=1
pkgdesc="the Advanced Prince of Persia Engine, based on 1989 release"
arch=('i686' 'x86_64')
url="https://oitofelix.github.io/mininim/"
license=('GPL3')
depends=('allegro')
makedepends=('gnulib')
source=(https://github.com/oitofelix/mininim/archive/v$pkgver.tar.gz)
md5sums=('4c503c3250a4203b21f839b56885b8e2')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|"${pkgdatadir}"|"$(DESTDIR)${pkgdatadir}"|g' Make*
  cd doc
  sed -i 's|"${infodir}"|"$(DESTDIR)$(infodir)"|g' Make*
}

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
