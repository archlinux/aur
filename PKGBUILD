# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=monty
pkgname=python-${_base}
pkgdesc="Monty is the missing complement to Python"
pkgver=2022.4.26
pkgrel=1
arch=('x86_64')
url="https://github.com/materialsvirtuallab/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-bson python-pandas python-pydantic python-ruamel-yaml python-tqdm)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1a194dea4872b27927b5044998bdf6b220191be376517afa88fa92835a7123f99c27d4dd81090cb932ed47a26a23852a171477b07454d4cc9c4edaa5a9b0afc2')

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
