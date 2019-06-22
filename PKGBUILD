# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgbase=python-cashier
pkgname=('python-cashier' 'python2-cashier')
_name=${pkgname#python-}
pkgver=1.3
pkgrel=1
pkgdesc="Persistent caching for python functions."
arch=('any')
url="https://github.com/atmb4u/cashier"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
sha256sums=('dcc8e150d0bbd58294fb82f665e70cc94afa11b26d41ddf48863ae78f40a7e23')

prepare() {
  cp -a cashier-$pkgver{,-py2}
}

build() {
  cd "${srcdir}"/cashier-${pkgver}
  python setup.py build

  cd "${srcdir}"/cashier-${pkgver}-py2
  python2 setup.py build
}

package_python-cashier() {
  cd cashier-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-cashier() {
  cd cashier-${pkgver}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
