# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenicsxprecice
pkgname=python-${_base}
pkgdesc="Adapter for the open source computing platform FEniCSx"
pkgver=1.0.1
pkgrel=1
arch=(any)
url="https://github.com/precice/fenicsx-adapter"
license=(LGPL-3.0)
depends=(python-pyprecice python-scipy precice-adapter-schema python-fenics)
makedepends=(python-build python-installer python-setuptools-git-versioning git)
# checkdepends=(python-pytest python-sympy)
source=(git+${url}.git#tag=v${pkgver})
sha512sums=('4e323a81eece9b3a4583199ff194f186c75256e8eaed9af245550b005861a9281269d2e840edd6ef0efe3e00955f5262c1408d3ce7782e21b467e8508c7b998f')

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
