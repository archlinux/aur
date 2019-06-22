# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgbase=python-backoff
pkgname=('python-backoff')
_name=${pkgname#python-}
pkgver=1.8.0
pkgrel=1
pkgdesc="A library that provides mapping objects that allow their elements to be accessed both as keys and as attributes."
arch=('any')
url="https://github.com/litl/backoff"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('c7187f15339e775aec926dc6e5e42f8a3ad7d3c2b9a6ecae7b535000f70cd838')

prepare() {
  cp -a backoff-$pkgver{,-py2}
}

build() {
  cd "${srcdir}"/backoff-${pkgver}
  python setup.py build

  cd "${srcdir}"/backoff-${pkgver}-py2
  python2 setup.py build
}

package_python-backoff() {
  cd backoff-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-backoff() {
  cd backoff-${pkgver}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
