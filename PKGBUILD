# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=CryptoLyzer
pkgname=python-${_base,,}
pkgver=1.0.2
pkgrel=1
pkgdesc="A comprehensive cryptographic settings analyzer"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL-2.0)
depends=(python-oscrypto python-beautifulsoup4 python-certvalidator python-colorama python-cryptoparser python-pyfakefs python-requests python-dnspython)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('3af6d9068f907254cbedfddba921e6671d25f434ded8cf1c6b8b56c21b7000e533e6bf2262c7a39b19536d0ab1a81dbf3972899976d0b19d73520d69db773488')

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
