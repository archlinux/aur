# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgbase=python-gspread
pkgname=('python-gspread' 'python2-gspread')
_pkgname=gspread
pkgver=3.7.0
pkgrel=1
pkgdesc="Google Spreadsheets Python API"
arch=('any')
url="https://github.com/burnash/gspread"
license=('Custom:MIT')
depends=('python-requests' 'python2-requests')
source=("https://github.com/burnash/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('43a22f0931791d108780004eab8d4c8c8a4d1284b47a531cedcb54d356ed41b6c155a1bbd53cb3084dd468308fa9bfcf9ce36ce26906ccc9167de172574d0ed4')

prepare() {
  cp -r "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py build
}

package_python-gspread() {
  depends=('python-requests')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-gspread() {
  depends=('python2-requests')

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
