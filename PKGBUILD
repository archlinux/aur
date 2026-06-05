# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=CryptoLyzer
pkgname=python-${_base,,}
pkgver=1.2.1
pkgrel=1
pkgdesc="A comprehensive cryptographic settings analyzer"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL-2.0)
depends=(python-oscrypto python-beautifulsoup4 python-certvalidator python-colorama python-cryptoparser python-pyfakefs python-requests python-dnspython)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('9064769e83db2b91fcd83eb55537b8b2d9675ea60069cde5c6c110253ab9b95f9d62eb204bf840b37c52f7743a0d634446ed7bec55d4d031faa7c97051c41261')

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
