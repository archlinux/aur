# Contributor: Michael Stegeman <mstegeman@mozilla.com>
_base=singleton-decorator
pkgname=python-${_base}
pkgver=1.0.0
pkgrel=1
pkgdesc="A testable decorator that allows you to easily create singleton objects"
arch=(any)
url="https://pypi.org/project/${_base}"
license=(GPL3)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('180376a79a7db65a9959b365cb0b44a1d165e31a5a50ff268c1f994eef635fd87414307074db13d7329ec989a0c23589f07119d3319a47f2387b09f9c71f1f3f')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
