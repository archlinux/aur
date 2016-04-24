# Contributor: Pablo Lluch <pablo dot lluch at gmail dot com>

pkgname=python2-spams
pkgver=2.5
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Optimization toolbox for solving various sparse estimation problems"
url="http://spams-devel.gforge.inria.fr/"
depends=('python2-scipy')
source=("http://spams-devel.gforge.inria.fr/hitcounter2.php?file=33816/spams-python-v$pkgver-svn2014-07-04.tar.gz"
        "python2-spams.patch")
md5sums=('bad3e1d319c6986bdda5afe1695713bd'
         '3b208b139fbe40034578987d849f405f')

prepare() {
  cd "$srcdir"/spams-python
  sed -i "s|if isnan(lambda) {|if (isnan(lambda)) {|g" spams/linalg/linalg.h 
}

build() {
  cd "$srcdir"/spams-python
  patch -Np1 -i ../python2-spams.patch
  python2 setup.py build
}

package() {
  cd "$srcdir"/spams-python
  python2 setup.py install --root="$pkgdir" --optimize=1
}

