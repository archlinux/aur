# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgbase=python-pycryptodome
pkgname=('python-pycryptodome' 'python2-pycryptodome')
pkgver=3.4.5
pkgrel=1
license=('BSD')
arch=('i686' 'x86_64')
url='http://www.pycryptodome.org/'
makedepends=('gmp' 'python-setuptools' 'python2-setuptools')
source=("pycryptodome-${pkgver}.tar.gz::https://github.com/Legrandin/pycryptodome/archive/v${pkgver}.tar.gz")
sha512sums=('666a90e0cd756b26212df29b2d88c7443bd12fcbf0db6afc6e251a4e92a8528d82495528610c834cd6c066eb384a83f075cb49d52c60c65af04c0e5ff3ce72f8')

prepare() {
  cp -a "pycryptodome-$pkgver"{,-python2}
}

build() {
  cd "$srcdir/pycryptodome-$pkgver"
  python setup.py build

  cd "$srcdir/pycryptodome-$pkgver-python2"
  python2 setup.py build
}

check() {
  cd "$srcdir/pycryptodome-$pkgver"
  python setup.py test

  cd "$srcdir/pycryptodome-$pkgver-python2"
  python2 setup.py test
}

package_python-pycryptodome() {
  pkgdesc="Collection of cryptographic algorithms and protocols, implemented for use from Python 3."
  depends=('python' 'gmp')
  conflicts=('python-crypto')
  provides=('python-crypto')

  cd "pycryptodome-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

package_python2-pycryptodome() {
  pkgdesc="Collection of cryptographic algorithms and protocols, implemented for use from Python 2."
  depends=('python2' 'gmp')
  conflicts=('python2-crypto')
  provides=('python2-crypto')

  cd "pycryptodome-$pkgver-python2"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
