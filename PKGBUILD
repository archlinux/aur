# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tree-sitter-matlab
pkgname=python-${_base}
pkgver=1.2.4
pkgrel=1
pkgdesc="MATLAB tree-sitter parser"
arch=(any)
url="https://github.com/acristoffers/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cbbb86b5d0a6b7fac305dc82604a3cda1bb0946e327fb79f112c92d4348ed6278c00e0b622c5eddbf62785f307037deef74c1e498ad8f718d386a9da2e8e3560')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
