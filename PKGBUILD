# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=mwoauth
pkgname=python-${_base}
pkgver=0.4.0
pkgrel=1
pkgdesc="Generic MediaWiki OAuth handshake helper for Python"
license=(MIT)
arch=(any)
url="https://github.com/mediawiki-utilities/${pkgname}"
depends=(python-pyjwt python-requests-oauthlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('29362d3c0c24e7ea10c537f02f2815fb721d57c14862953d43312edd10142c7df174628d1eb097fb4d8304d989290a1f314f0e8e11d693238c9743b03e569436')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
