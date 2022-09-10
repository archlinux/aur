# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=monty
pkgname=python-${_base}
pkgdesc="Monty is the missing complement to Python"
pkgver=2022.9.9
pkgrel=1
arch=(x86_64)
url="https://github.com/materialsvirtuallab/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-bson python-pandas python-pydantic python-ruamel-yaml python-tqdm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('987cce5aacbdaa514a61b766c361775a054b8651e9b3dc2db23b0fe8117574c7eb539228a1b2e2b22e61e6de8348c805f336e8c4f6d4853de81d352273b16eb9')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest tests -k 'not io and not zpath'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
