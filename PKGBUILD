# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=monty
pkgname=python-${_base}
pkgdesc="Monty is the missing complement to Python"
pkgver=2022.9.8
pkgrel=1
arch=(x86_64)
url="https://github.com/materialsvirtuallab/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-bson python-pandas python-pydantic python-ruamel-yaml python-tqdm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3ea10ed3147571d2dc4bbe6a8cc246613986d89144fa4367d28fcdff4052d0021b229e32c9d6f5635251c076f456dc71509c4b607edc6397246ab9213803d0c8')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
