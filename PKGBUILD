# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CryptoDataHub
pkgname=python-${_base,,}
pkgver=1.2.1
pkgrel=1
pkgdesc="Repository of cryptography-related data"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL-2.0)
depends=(python-asn1crypto python-attrs python-dateutil python-urllib3)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pyfakefs)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('a1bcba4c11bf6b0f6bccb372f4df4967e12f70b3f3dcc7d8907de2483d5cd64edd7cf0e72508e61926845846d35f8ef34cb57ae7af5dfc403b040d1712d652b0')

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
