# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>
_base=scikit-umfpack
pkgname=python-${_base}
pkgdesc="Python interface to UMFPACK sparse direct solver"
pkgver=0.4.2
pkgrel=1
arch=(x86_64)
url="https://${_base}.github.io/${_base}"
license=(BSD-3-Clause)
depends=(python-scipy suitesparse)
makedepends=(python-build python-installer meson-python python-wheel swig)
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('16317a2b0301a55a8436beb6a5f1e2a697b9554dd15668bf463ac2d00af6aa98b202bf05da81e5439eb407ed463b64709796f5dcd04a2732c3e273c4a5fb86c2')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest scikits/umfpack/tests --pyargs ${_base/-/.}
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
