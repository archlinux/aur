# Maintainer: Jeff Barfield (noprobelm[at]protonmail[dot]org)

pkgname=python-terminaltables
_pyname=terminaltables
pkgver=3.1.0
pkgrel=10
pkgdesc="Generate simple tables in terminals from a nested list of strings"
arch=('any')
url="https://github.com/Robpol86/terminaltables"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-colorama' 'python-termcolor' 'python-colorclass')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/Robpol86/${_pyname}/archive/v${pkgver}.tar.gz"
        python-3.8.patch)
sha512sums=('dc49458652fff8bc6094d316d84c9b8e9fca1a26e3230c0b668bc03ec8528793f4ef024e8032d4a56fbfabfdfd4a1142870f550f0b373ba6a42dd2e3ead3f501'
            '9a33ef51cbd2854bf9acc247e2d966332229446158e7dae9cad25e03335eb9689d50b0a22234285aa56c707e6e93c12f950299efcfbe7e42ed527216090592f2')

prepare() {
  cd ${_pyname}-${pkgver}
  patch -Np1 < ../python-3.8.patch
}

build() {
  cd ${_pyname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pyname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 example*.py -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}

# vim:set et sw=2 ts=2 tw=79:
