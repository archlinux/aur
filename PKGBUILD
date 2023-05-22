# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: G. Bernstein, M. Jarvis and E. Sheldon
_base=pixmappy
pkgname=python-${_base}
pkgver=1.0.0
pkgrel=1
pkgdesc="Python module for arbitrary mappings from pixels to sky coordinate"
arch=(any)
url="https://github.com/gbernstein/${_base}"
license=('BSD')
depends=(python-numpy python-future python-astropy python-scipy python-yaml python-coord)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-galsim)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6f406c30ff7de662ebdbaa47a44626fb363e066584d656f80e0a4ecfb83bba53421a3e9d55966bfa020035e48149c7e0d4183ad97d78e86283c1b1c2f3cf687f')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 Piff_LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
