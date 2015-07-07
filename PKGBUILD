# Maintainer: Marcel Schneider <marcel@coopmasters.de>
pkgname=csv2xls
pkgver=0.3.4
pkgrel=1
pkgdesc="a command line utility which converts csv files into one (or more if splitted) Excel(TM) files."
arch=('i686' 'x86_64')
url="https://github.com/ferkulat/csv2xls"
license=('GPL')
groups=()
depends=('libcsv' 'xlslib')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/ferkulat/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('608dbb4b9214507afc39159ec6b0901d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
   # libcsv-3.0.1 installs csv.h into /usr/include/libcsv
   export CPPFLAGS=-I/usr/include/libcsv
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
