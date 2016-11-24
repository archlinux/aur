# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgbase=pycryptodome
pkgname=('python-pycryptodome' 'python2-pycryptodome')
pkgver=3.4.3
pkgrel=1
license=('BSD')
arch=('i686' 'x86_64')
url='http://www.pycryptodome.org/'
makedepends=('gmp' 'python-setuptools' 'python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Legrandin/${pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('e10b7725deb6bcfc9500e5467ee68f68192bc4cbf5e89428eed73c3611fd6b24')

prepare() {
  cp -a "${pkgbase}-$pkgver"{,-python2}
}

build() {
  cd "$srcdir/${pkgbase}-$pkgver"
  python setup.py build

  cd "$srcdir/${pkgbase}-$pkgver-python2"
  python2 setup.py build
}

check() {
  cd "$srcdir/${pkgbase}-$pkgver"
  python setup.py test

  cd "$srcdir/${pkgbase}-$pkgver-python2"
  python2 setup.py test
}

package_python-pycryptodome() {
  pkgdesc="Collection of cryptographic algorithms and protocols, implemented for use from Python 3."
  depends=('python' 'gmp')
  conflicts=('python-crypto')

  cd "${pkgbase}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

package_python2-pycryptodome() {
  pkgdesc="Collection of cryptographic algorithms and protocols, implemented for use from Python 2."
  depends=('python2' 'gmp')
  conflicts=('python2-crypto')

  cd "${pkgbase}-$pkgver-python2"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
