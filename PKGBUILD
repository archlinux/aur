# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_pkgname=cognitive_face
pkgname=(python-${_pkgname} python2-${_pkgname})
pkgver=1.2.1
pkgrel=1
pkgdesc="Python SDK for the Microsoft Face API"
arch=(any)
url="https://github.com/Microsoft/Cognitive-Face-Python"
license=('MIT')
groups=()
makedepends=('python-setuptools' 'python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('8bba73308815d447f67ae74e39205995')

build() {
  cp -rf ${_pkgname}-${pkgver} ${_pkgname}2-${pkgver}
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
  cd "${srcdir}/${_pkgname}2-${pkgver}"
  python2 setup.py build
}

package_python-cognitive_face() {
  depends=('python-requests')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root=$pkgdir/ --optimize=1
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python2-cognitive_face() {
  depends=('python2-requests')
  cd "${srcdir}/${_pkgname}2-${pkgver}"
  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
