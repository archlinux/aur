# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-mahotas
pkgver=1.4.11
pkgrel=1
pkgdesc='A set of functions for image processing in Python'
arch=('i686' 'x86_64')
url='http://mahotas.readthedocs.io/en/latest/'
license=('GPL')
depends=('python2-numpy')
makedepends=('python2-distribute')
optdepends=('python2-scipy' 'python2-matplotlib' 'freeimage')
checkdepends=('python2-scipy' 'python2-imread' 'python2-nose' 'python2-pillow')
source=(matohas-$pkgver.tar.gz::https://github.com/luispedro/mahotas/archive/v$pkgver.tar.gz)
sha256sums=('af9f1de41e16cfb54fb3719b81d93b98e3888a413a439dd0ce1cdbf076cf2ae6')

build() {
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py build
}

check_disabled() {
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py test
}

package() {
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/python-mahotas/LICENSE
}
