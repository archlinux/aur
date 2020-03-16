# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=terminaltables
pkgname=('python2-terminaltables')
pkgver=3.1.0
pkgrel=6
pkgdesc="Generate simple tables in terminals from a nested list of strings, python2 version"
arch=('any')
url="https://github.com/Robpol86/terminaltables"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
replaces=('python2-terminaltables<=3.1.0-5')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/Robpol86/${_pyname}/archive/v${pkgver}.tar.gz")
sha512sums=('dc49458652fff8bc6094d316d84c9b8e9fca1a26e3230c0b668bc03ec8528793f4ef024e8032d4a56fbfabfdfd4a1142870f550f0b373ba6a42dd2e3ead3f501')

prepare() {
  cd ${_pyname}-${pkgver}
  sed -i -e s/python/python2/g example*.py
}

build() {
  cd ${_pyname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 example*.py -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}

# vim:set et sw=2 ts=2 tw=79:
