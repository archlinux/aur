# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CryptoDataHub
pkgname=python-${_base,,}
pkgver=1.6.1
pkgrel=1
pkgdesc="Repository of cryptography-related data"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL-2.0)
depends=(python-asn1crypto python-attrs python-dateutil python-urllib3)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pyfakefs)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('0388a81c4aee7feca558c9bc9c771dc5cb41d22e7447e3f6b01a9f10f11f0c6a76d1fe7aa801d8da7d795b9fba5f3856bccdfe75a3b8058ba6a16419390ae357')

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
