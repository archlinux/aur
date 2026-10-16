# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=innerscope
pkgname=python-${_base}
pkgdesc="Expose the inner scope of functions"
pkgver=0.8.0
pkgrel=1
arch=(any)
url="https://github.com/eriknw/${_base}"
license=(BSD-3-Clause)
depends=(python-toolz)
makedepends=(python-build python-installer python-setuptools-git-versioning python-wheel)
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0663c8763ddcf0850a0857490f1cdc252a6032ccbb73efce81a51f7c22331b9dab2034dab5cabc579f2b61f26abe663fbefc309f7734e161d873f60929b60cf3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
