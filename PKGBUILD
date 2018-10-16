# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=('python2-advancedhtmlparser' 'python2-advancedhtmlparser-tools')
pkgver=8.1.0
pkgrel=1
pkgdesc="Fast Indexed python2 HTML parser which builds a DOM node tree, providing common getElementsBy* functions for scraping, testing, modification, and formatting"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/AdvancedHTMLParser"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
optdepends=('python2-queryablelist: Support for advanced "filter" functions')
source=("https://github.com/kata198/AdvancedHTMLParser/archive/${pkgver}.tar.gz")
sha512sums=("6b16f61538504faae3d7c02628ae3607305f23a866b5f9f8fa13a75f96271090b8446e38f6b7c126dc43503d7e63ff8a5799478b00eb372926baca59caa45dbc")

build() {
  cd "$srcdir"/AdvancedHTMLParser-$pkgver
  python2 setup.py build
}

package_python2-advancedhtmlparser() {
  cd AdvancedHTMLParser-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove tools from lib package
  rm -Rf "$pkgdir/usr/bin"
}
package_python2-advancedhtmlparser-tools() {
  depends=('python2-advancedhtmlparser')
  conflicts=('python-advancedhtmlparser-tools')
  optdepends=()
  cd AdvancedHTMLParser-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove lib from tools package
  rm -Rf "${pkgdir}/usr/lib"
}
