# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=CryptoLyzer
pkgname=python-${_base,,}
pkgver=1.2.0
pkgrel=1
pkgdesc="A comprehensive cryptographic settings analyzer"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL-2.0)
depends=(python-oscrypto python-beautifulsoup4 python-certvalidator python-colorama python-cryptoparser python-pyfakefs python-requests python-dnspython)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('14b21bb5d5d9c88a644471024f1bc7095f2ab5eb20ed602bce9a0fc8743fc2024af2aa80b53c78ddfeda79816fde78e9128507c46f222fe3be868567d9de6958')

build() {
  cd ${_base,,}-v${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base,,}-v${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
