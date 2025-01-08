# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CryptoDataHub
pkgname=python-${_base,,}
pkgver=1.0.0
pkgrel=1
pkgdesc="Repository of cryptography-related data"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL-2.0)
depends=(python-asn1crypto python-attrs python-dateutil python-urllib3)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pyfakefs)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('6402bd330124e006a7b4e7b3bebd80e4d38d07b5ff57c8af76148be6a63dd31876f7632fe496b8606d1e0d743ae0a77856bc782e3e41f28f09c5873eb22f4995')

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
