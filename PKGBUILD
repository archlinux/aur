# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgbase=python-gspread
pkgname=('python-gspread' 'python2-gspread')
_pkgname=gspread
pkgver=3.1.0
pkgrel=1
pkgdesc="Google Spreadsheets Python API"
arch=('any')
url="https://github.com/burnash/gspread"
license=('Custom:MIT')
depends=('python-requests' 'python2-requests')
source=("https://github.com/burnash/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8d1072bdd45fe2287cbc5bbc5fd6d6f615343898fca811687d0ebe6dea266ded7fd795693067d423e9a55cc83ebc5a12a38ab70db9b61cec65e8f766dbead0b2')

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
