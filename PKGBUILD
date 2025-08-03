# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=torchquad
pkgname=python-${_base}
pkgdesc="Package providing torch-based numerical integration methods"
pkgver=0.5.0
pkgrel=1
arch=(any)
url="https://github.com/esa/${_base}"
license=(GPL-3.0-or-later)
depends=(python-loguru python-matplotlib python-scipy python-tqdm python-autoray)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b2864b829b869ef0e825088c4d149c1b854ae644d9a647da3b457932fda862921fa975f318de6349e86a3c551868bcea53f7716e4da3405009754e63bba13809')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
