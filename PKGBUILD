# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-mwoauth
pkgver=0.3.0
pkgrel=2
pkgdesc="Generic MediaWiki OAuth handshake helper for Python"
license=(MIT)
arch=('any')
url="https://github.com/mediawiki-utilities/${pkgname}"
depends=(python-pyjwt python-requests-oauthlib)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4d07726687e55669d63de00c5ef2a65400e7c62c269e99c26e3b26873d93074434f96fb886eaa57fffc7738e2f763a84f833b44ff33e27a523a0e9ab930d6dd4')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
