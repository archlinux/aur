# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=mininim
pkgver=201701122309
pkgrel=1
pkgdesc="the Advanced Prince of Persia Engine, based on 1989 release"
arch=('i686' 'x86_64')
url="https://oitofelix.github.io/mininim/"
license=('GPL3')
depends=('allegro')
makedepends=('gnulib' 'help2man')
source=("https://github.com/oitofelix/mininim/archive/v$pkgver.tar.gz")
md5sums=('da4e45c0aa08f689cd4848dcc8de9214')

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
