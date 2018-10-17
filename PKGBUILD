# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=('python-advancedhtmlparser' 'python-advancedhtmlparser-tools')
pkgver=8.1.3
pkgrel=1
pkgdesc="Fast Indexed python HTML parser which builds a DOM node tree, providing common getElementsBy* functions for scraping, testing, modification, and formatting"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/AdvancedHTMLParser"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
optdepends=('python-queryablelist: Support for advanced "filter" functions')
source=("https://github.com/kata198/AdvancedHTMLParser/archive/${pkgver}.tar.gz")
sha512sums=("2c5722f46cc6d621dbaa6a51333ce80fb071678fe7f37b02cc22616daaa82125a7e39e64b2ffb80df9bad1d4626516fb1bdd66493bb2285fa79bf03c07abc368")

build() {
  cd "$srcdir"/AdvancedHTMLParser-$pkgver
  python setup.py build
}

package_python-advancedhtmlparser() {
  cd AdvancedHTMLParser-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove tools from lib package
  rm -Rf "$pkgdir/usr/bin"
}
package_python-advancedhtmlparser-tools() {
  depends=('python-advancedhtmlparser')
  conflicts=('python2-advancedhtmlparser-tools')
  optdepends=()
  cd AdvancedHTMLParser-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove lib from tools package
  rm -Rf "${pkgdir}/usr/lib"
}
