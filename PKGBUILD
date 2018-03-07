# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgbase=python-pycryptodome
pkgname=('python-pycryptodome' 'python2-pycryptodome')
_name=pycryptodome
pkgver=3.5.0
pkgrel=1
license=('BSD')
arch=('x86_64')
url='http://www.pycryptodome.org/'
makedepends=('gmp' 'python-setuptools' 'python2-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://github.com/Legrandin/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('83a21bbbb523ad4e21a37b3e9fa878b8979dd7f1bbbad9df35acef16551d26aa')
sha512sums=('ebefbda153b96ff79ecc3b7feff9e7f0df7cd069fdf1d574cfabe30f55fdf04d0dbe7fdd967c862d882045bca8c9df3eb733dc8f125799846eba5578431377db')

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
