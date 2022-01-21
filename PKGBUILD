# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=memoized-property
pkgname=python-${_base}
pkgver=1.0.3
pkgrel=3
pkgdesc="A simple python decorator for defining properties that only run their fget function once"
arch=('any')
url="https://github.com/estebistec/${pkgname}"
license=('custom:BSD-3-clause')
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('8a8fdb548b8ea36e42ca878b299f128b7d349bf334ddadcfd7dda9b507d9a04a3ab7985145ad4ac21b3fdf52be9e442e1e1f08124b3730f264290d8e11551897')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
