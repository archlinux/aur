# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=innerscope
pkgname=python-${_base}
pkgdesc="Expose the inner scope of functions"
pkgver=0.7.0
pkgrel=2
arch=(any)
url="https://github.com/eriknw/${_base}"
license=(BSD-3-Clause)
depends=(python-toolz)
makedepends=(python-build python-installer python-setuptools-git-versioning python-wheel)
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('e6466af419706c9901185c6d42d15a0cdf267a14f74a13bfc096a259ed6e2f871489f2da62fbc55135f1d67757e4a218f1298ff95e3180da86ea0399b6656fa4')

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
