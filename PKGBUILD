# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=('python-pyld' 'python2-pyld')
_pkgname='pyld'
pkgver=0.7.1
pkgrel=1
pkgdesc="An implementation of the JSON-LD specification in Python"
arch=('any')
url="https://github.com/digitalbazaar/pyld"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://github.com/digitalbazaar/${_pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('1db8aa6523183df5b427580e2b2504c871769c2c7c4612f3b93b7509651f4fd0fb17a0d0ccf251135b908648e32b256d2de9e118161586393ad332c7d8ad4cad')

prepare() {
  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py build
}

package_python-pyld() {
  depends=('python-setuptools')

  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py install --root="${pkgdir}" -O1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-pyld() {
  depends=('python2-setuptools')

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"

  python2 setup.py install --root="${pkgdir}" -O1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
