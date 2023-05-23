# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gabriel "ArcturusB" Perouze" <arcturus@openmailbox.org>
_base=sep
pkgname=python-${_base}
pkgver=1.2.1
pkgrel=1
pkgdesc="Astronomical source extraction and photometry library"
arch=(x86_64)
url="https://github.com/kbarbary/${_base}"
license=(MIT LGPL3)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel cython) # swig
checkdepends=(python-pytest python-astropy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2f5815363a11bfff67093e80a3fd5ba8b790e52226d1df39eee18a6a4195caaf82317712668c64ba2bc108b29a60dca2bdda87e920291aa28cde9633b73ff1b6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest test.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
