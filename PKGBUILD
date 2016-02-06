# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=python-olefile
pkgname=('python-olefile' 'python2-olefile')
_pyname=olefile
pkgver=0.43
pkgrel=1
pkgdesc="Python library to parse, read and write Microsoft OLE2 files (formerly OleFileIO_PL)"
url="http://www.decalage.info/olefile"
arch=('any')
license=('BSD')
makedepends=('python' 'python2')
source=(https://bitbucket.org/decalage/olefileio_pl/downloads/${_pyname}-${pkgver}.zip)
sha512sums=('7642d559ab71525fe70b06a106608a82c4b25b3f389fdf1805ee6795ac5b3d2c0957e126d60b2d791008a6431d9f9e599df13767802c37800e275292b980de8e')

prepare() {
  cp -ra ${_pyname}-${pkgver}{,py2}
}

package_python-olefile() {
  depends=('python')
  replaces=('python3-olefileio')
  conflicts=('python3-olefileio')

  cd ${_pyname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 ${_pyname}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md ${_pyname}/doc/* -t "${pkgdir}/usr/share/doc/${pkgname}/README"

}

package_python2-olefile() {
  depends=('python2')
  replaces=('python2-olefileio')
  conflicts=('python2-olefileio')

  cd ${_pyname}-${pkgver}py2
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 ${_pyname}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md ${_pyname}/doc/* -t "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
