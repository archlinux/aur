# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tree-sitter-matlab
pkgname=python-${_base}
pkgver=1.2.5
pkgrel=1
pkgdesc="MATLAB tree-sitter parser"
arch=(any)
url="https://github.com/acristoffers/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d639092b7592b8feaf56f87b64a89d9774f75002ffed9935adffcf2c4d4b15a12ad8a35ebfdae10ecd144c28b8ad0127970252c13d9dde60e2811c418b8e8ae3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
