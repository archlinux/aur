# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=lsq-ellipse
pkgname=python-${_base}
pkgdesc="Fitting an Ellipse using a Least Squares method, in Python"
pkgver=2.2.1
pkgrel=1
arch=(any)
url="https://pypi.org/project/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('a76ea125aea94b637b4cdb9aa9a0de8cd3b38f98ddd3760a6ab20981a931a946622085e31369e3100535810e7dfd6357f384dcdabdf8bc085bb78bc4944192fb')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   PYTHONPATH="$PWD/build/lib/:$PYTHONPATH" python test.py
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
