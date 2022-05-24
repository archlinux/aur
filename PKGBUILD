# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=mwoauth
pkgname=python-${_base}
pkgver=0.3.8
pkgrel=1
pkgdesc="Generic MediaWiki OAuth handshake helper for Python"
license=(MIT)
arch=(any)
url="https://github.com/mediawiki-utilities/${pkgname}"
depends=(python-pyjwt python-requests-oauthlib)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('29e70f7e40e4a7625c50ba3b619124c33af2cb82139895eaa834e161e4650a6b08e987f04b2a2b09395f625b146c052bb04a512b1939a8b931947b20dee1f6df')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
