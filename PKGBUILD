# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=xdrawchem
pkgver=1.10.2
pkgrel=3
pkgdesc='A two-dimensional molecule drawing program'
url='http://www.woodsidelabs.com/chemistry/xdrawchem.php'
license=("GPL")
arch=('x86_64')
depends=('openbabel' 'qt5-base')
source=($pkgname-$pkgver.tar.gz::"https://github.com/bryanherger/$pkgname/archive/$pkgver-1.tar.gz"
        "obabel3.patch")
sha256sums=('009b525e570cd79b3e59880877871e258071fecdef6c397d7533f3920faa9a7e'
            '0bbeea4a28a43641a11c7a54d925c9b31f1301d5d836aae2d0e95a42cb53cd0a')
options=('!libtool')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-1"
  patch -p1 < "$srcdir/obabel3.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver-1/xdrawchem-qt5"
  qmake PREFIX='/usr' INCLUDEPATH='/usr/include/openbabel3'
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver-1/xdrawchem-qt5"
  install -Dm755 bin/xdrawchem "$pkgdir/usr/bin/xdrawchem"
  install -Dm755 ring/* -t "$pkgdir/usr/share/xdrawchem"
  install -Dm755 doc/* -t "$pkgdir/usr/share/xdrawchem/doc"
}
