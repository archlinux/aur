# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=CryptoLyzer
pkgname=python-${_base,,}
pkgver=0.12.4
pkgrel=1
pkgdesc="Fast and flexible server cryptographic (TLS/SSL) settings analyzer library"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL-2.0)
depends=(python-oscrypto python-attrs python-certvalidator python-colorama python-cryptoparser python-pyfakefs python-requests python-dnspython python-urllib3)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('2da5f18ff4e5d9475e2d4969204ee8a643a2df59b695012492214a62346e9bfa7081c8eaf99c06cccb75013968be56e8ef629e1533e60d1fa3227795c2bc63ce')

build() {
  cd ${_base,,}-v${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base,,}-v${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
