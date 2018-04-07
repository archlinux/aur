# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgbase=python-pycryptodome
pkgname=('python-pycryptodome' 'python2-pycryptodome')
_name=pycryptodome
pkgver=3.6.0
pkgrel=2
license=('BSD')
arch=('x86_64')
url='http://www.pycryptodome.org/'
makedepends=('gmp' 'python-setuptools' 'python2-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://github.com/Legrandin/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('5efd0f0ac68d3420550de40b272bfaae275889655fb59a92d79a6f3cf6cec8c9')
sha512sums=('84657e14542f33e26ade9e7e3758b0f5b211be6bb76b5edb6f5b9ccab4f68d69ccaf4b5672ac417bc2df00044eaa2f92ade997590e6907d37216460b87e14281')

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
