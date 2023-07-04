# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>

_py=python2
_pkg=wokkel
pkgname="${_py}-${_pkg}"
# pkgver=0.7.1
pkgver=18.0.0
pkgrel=1
pkgdesc="Twisted Jabber support library"
license=(
  'custom:"Wokkel License"'
)
url="http://${_pkg}.ik.nu/"
_url="https://github.com/ralphm/${_pkg}"
arch=(any)
depends=(
  "${_py}-twisted"
)
makedepends=(
  "${_py}-setuptools"
)
source=(
  "${_pkg}-${pkgver}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
  'dc980eb2c2ebea2a7b7f5b05883bbfdb10bea4ca495853326470e9cb5b1f9b7b'
)

build() {
  cd "${_pkg}-${pkgver}"
  "${_py}" setup.py build
}

package() {
  cd "${_pkg}-${pkgver}"
  "${_py}" setup.py install --skip-build \
                            -O1 \
                            --root="${pkgdir}"
  install -Dm644 LICENSE \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
