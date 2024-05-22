# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=flowdyn
pkgname=python-${_base}
pkgdesc="Model of discretization of hyperbolic model, base is Finite Volume method"
pkgver=1.3.1
pkgrel=1
arch=(any)
url="https://github.com/jgressier/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-poetry-core python-wheel)
optdepends=('python-aerokit' 'python-matplotlib')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('15956ea29733a4ae90a262c4ca642e035cd2ad6cb18106948f38c1e29b59695e49d42e1139b6c527095546457b7dba602b3c5c106c4680faeee740985cf9126b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
