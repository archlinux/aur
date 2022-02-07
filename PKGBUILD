# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=geneimpacts
pkgname=python-${_base}
pkgver=0.3.7
pkgrel=1
pkgdesc="normalize effects from variant annotation tools (snpEff, VEP)"
arch=(any)
url="https://pypi.org/project/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-nose)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('317f6f2122416266144d13d9e9a3623da9f15a6df85f2d329f2200389f9acfbc455ef2b9adf0ff335e3ca578ac013d8c9e49690f5e42466bea7641436dd5e0e4')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m nose
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
