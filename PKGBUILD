# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Germán Osella Massa <gosella@gmail.com>
_base=mpld3
pkgname=python-${_base}
pkgver=0.5.7
pkgrel=1
pkgdesc="D3 Viewer for Matplotlib"
arch=(any)
url="https://${_base}.github.io"
license=(BSD-3-Clause)
depends=(python-matplotlib python-jinja)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-diffimg python-nose)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('a69c6478fe726c0e99a707048ab98b6adb2a54efac4a635b05840e88d4724c24c782c25f14f2fa0100c9d1b6e86becc8b50066e46700b3276d646a80b034bd7d')

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
