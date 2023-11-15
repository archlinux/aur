# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CryptoDataHub
pkgname=python-${_base,,}
pkgver=0.11.2
pkgrel=1
pkgdesc="Repository of cryptography-related data"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL2)
depends=(python-asn1crypto python-attrs python-dateutil python-six python-urllib3)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pyfakefs)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('22a404d4e3f65eb4c7ded31f59e29f39c82be4c96e8808fc6565a11c5e266efb877140d540cd7962843a7dcad0d2b57e530a4885ea8f417d4de0063cb1515b08')

build() {
  cd ${_base,,}-v${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base,,}-v${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest test
# }

package() {
  cd ${_base,,}-v${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
