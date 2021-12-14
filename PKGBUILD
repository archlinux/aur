# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=mwoauth
pkgname=python-${_base}
pkgver=0.3.7
pkgrel=2
pkgdesc="Generic MediaWiki OAuth handshake helper for Python"
license=(MIT)
arch=('any')
url="https://github.com/mediawiki-utilities/${pkgname}"
depends=(python-pyjwt python-requests-oauthlib)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('e16db48633d4f476b4f46e22dce06ae355e2ff07926ea7c2ccad56a3548d471711556f87bc8abcae454b61943c1f8c1b24b42fec1a28906f0d4196c045bf339a')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
