# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Greene <mgreene@securityinnovation.com>

_pkgname=solid
pkgname="python-${_pkgname}"
pkgver=1.0.2
pkgrel=1
pkgdesc='Python interface to the OpenSCAD declarative geometry language'
arch=('any')
url='https://github.com/SolidCode/SolidPython'
_rawurl="https://raw.githubusercontent.com/${url##*github.com/}"
license=('GPL2')
depends=('python' 'python-euclid3' 'python-prettytable' 'python-pypng' 'python-regex')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}python/${_pkgname}python-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}-README.rst::${_rawurl}/master/README.rst")
sha256sums=('b298ba3a2e9bd999fdb9cd95dc347aa3b92bce88c83d2e9527a77779ddef8940'
            'SKIP')

build() {
  cd "${_pkgname}python-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 "${_pkgname}-${pkgver}-README.rst" "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
  cd "${_pkgname}python-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
