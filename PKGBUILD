# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=poethepoet
pkgname=python-${_base}
pkgdesc="A task runner that works well with poetry"
pkgver=0.32.1
pkgrel=1
arch=(any)
url="https://github.com/nat-n/${_base}"
license=(MIT)
depends=(python-pastel python-tomli)
makedepends=(python-build python-installer python-poetry-core python-wheel)
optdepends=('python-poetry')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6eb631649ae6f7bcdeee8efaa403c934099fd1d77c777e8ef02bf30a7a32996b19f71d2c809a6c8930768e34be28560aef9017bf902eb0cab4fca6f95b2094b4')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
