# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=poethepoet
pkgname=python-${_base}
pkgdesc="A task runner that works well with poetry"
pkgver=0.25.1
pkgrel=1
arch=(any)
url="https://github.com/nat-n/${_base}"
license=(MIT)
depends=(python-pastel python-tomli python-poetry)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('126a76fedf849446fe651e2ce6fae022e2888fe1e3c0f5f0238d6782ee8dd0c65c1aeb7af6c4dbaf5abfe77a7e90eee4fc0f568a704f8aeb75836dfa840da194')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
