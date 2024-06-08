# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=torchquad
pkgname=python-${_base}
pkgdesc="Package providing torch-based numerical integration methods"
pkgver=0.4.0
pkgrel=1
arch=(any)
url="https://github.com/esa/${_base}"
license=(GPL-3.0-or-later)
depends=(python-loguru python-matplotlib python-scipy python-tqdm python-autoray)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5ac7303c0a160a8857e59c85b7dd65fdd8d91dd3e0197cf568b06254f166af7c4f11f2ca4565a4bf3062c429aeb779216938a9934ea09ddcfba92ef174b53cf2')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
