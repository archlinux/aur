# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: William J Bowman <bluephoenix47@gmail.com>

pkgname='python2-certifi'
_name="${pkgname#python2-}"
pkgver=2019.6.16
pkgrel=3
pkgdesc="Package providing Mozilla's CA Bundle (for Python 2)"
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('custom:MPL2')
depends=('python2')
makedepends=('python2-setuptools')
_tarname="${_name}-${pkgver}"
source=("https://pypi.io/packages/source/${_name:0:1}/${_name}/${_tarname}.tar.gz")
sha512sums=('4641626bc5073cd0b3a520855ddef1007dcb42933baa7a3469856f936e725581042bcbd5b67e984ba9748e7faa62b9125cba7dc160dcc5db2eafe46461a29f5e')

prepare() {
  cd "${_tarname}"
  sed -i '1s|python$|python2|' certifi/core.py
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  cd "${_tarname}"
  python2 setup.py install --skip-build -O1 --root="${pkgdir}"
  install -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
