# maintainer: Yujun Fan <dlutfyj@outlook.com>
_base=Fast-Poisson-Image-Editing
pkgname=python-fpie
pkgver=0.2.4
pkgrel=1
pkgdesc="A fast poisson image editing algorithm implementation"
arch=(any)
url="https://github.com/Trinkle23897/${_base}"
license=(MIT)
depends=(python)
optdepends=(python-numpy gcc cmake cuda python-numba python-mpi4py python-taichi)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-main.zip::${url}/archive/refs/heads/main.zip)
sha256sums=('130fd9a7a3b59d3401e9d384e342d2a6c3d1b7f595ec16f1b71b1483c29742fd')

build() {
  cd ${_base}-main
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-main
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

