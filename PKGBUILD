# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenicsxprecice
pkgname=python-${_base}
pkgdesc="Adapter for the open source computing platform FEniCSx"
pkgver=1.0.2
pkgrel=1
arch=(any)
url="https://github.com/precice/fenicsx-adapter"
license=(LGPL-3.0)
depends=(python-pyprecice python-scipy precice-adapter-schema python-fenics-dolfinx)
makedepends=(python-build python-installer python-setuptools-git-versioning git)
# checkdepends=(python-pytest python-sympy)
source=(git+${url}.git#tag=v${pkgver})
sha512sums=('dd9705ad9812b5b9dc662f48b11f590a493693ed83854c4d5df240574931858b2e3fa4008aace3d7c7143c326a2838806ec121cc7c36f3d14e4922c3bb79a64a')

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
