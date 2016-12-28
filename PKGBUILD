# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=('python-graphene' 'python2-graphene')
_pkgname='graphene'
pkgver=1.1.3
pkgrel=1
pkgdesc="A Python library for building GraphQL schemas/types fast and easily"
arch=('any')
url="http://graphene-python.org/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://github.com/graphql-python/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('933e3f4614c178b9698cab1ad57cd5dc1d37771181556b0e9864e62873a7ff062ac8b24328d07e1ad8eb2397e0425ae17d3eb0b14f61b6fb4472ff16d7689693')

prepare() {
  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py build
}

package_python-graphene() {
  depends=('python-setuptools')

  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py install --root="${pkgdir}" -O1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-graphene() {
  depends=('python2-setuptools')

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"

  python2 setup.py install --root="${pkgdir}" -O1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
