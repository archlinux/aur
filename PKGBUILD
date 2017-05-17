# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgbase=python-pycryptodome
pkgname=('python-pycryptodome' 'python2-pycryptodome')
pkgver=3.4.6
pkgrel=1
license=('BSD')
arch=('i686' 'x86_64')
url='http://www.pycryptodome.org/'
makedepends=('gmp' 'python-setuptools' 'python2-setuptools')
source=("pycryptodome-${pkgver}.tar.gz::https://github.com/Legrandin/pycryptodome/archive/v${pkgver}.tar.gz")
sha256sums=('9beefd5d4e468108b43609246274469783945a89123d2525356eb86026967c69')
sha512sums=('40c9ea4cf7fca06bd7cd3a100e1d602e0130fbdcc75544ff1353ced2fae8925d29286200561832f2524a0f3db155a6924bb653d964408d4486aab694bf275cdc')

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
