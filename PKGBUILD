# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=soundcloud-syncer
pkgver=0.3.4
pkgrel=2
pkgdesc="Synchronize user's favorites tracks from soundcloud"
url="https://github.com/sliim/${pkgname}"
depends=(python-stagger python-pydub python-dateutil python-magic)
makedepends=(python-setuptools)
license=(GPL3)
arch=('any')
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('3c90b7d0682cc21c9fc40bce097a089d5a3fd7597f03471094b88894fa2a5806263f92f0fac7fe8479b0e42300a3a98dd82849bc17baf90b47b9c3e2b798a5f3')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
