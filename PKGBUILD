# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tree-sitter-matlab
pkgname=python-${_base}
pkgver=1.3.0
pkgrel=1
pkgdesc="MATLAB tree-sitter parser"
arch=(any)
url="https://github.com/acristoffers/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('773f5e6bec7de646058ef83fe55308b275df90e2acdebeb1ef51dc56f90ca12c415a8fd59e03e23994e74c47d2fe07cfca571d624e33341d39b54ac20a8e963b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
