# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CryptoDataHub
pkgname=python-${_base,,}
pkgver=1.0.2
pkgrel=1
pkgdesc="Repository of cryptography-related data"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL-2.0)
depends=(python-asn1crypto python-attrs python-dateutil python-urllib3)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pyfakefs)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('938408ed17c717d40965fb5556701783dbfc6b822d59e6a9ce6c0f1c05540dc17957d9c06969ba70e068fe0cec3b275254699741e186956a5dcb74f79ea9079a')

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
