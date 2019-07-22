# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=('python2-advancedhtmlparser' 'python2-advancedhtmlparser-tools')
pkgver=8.1.8
pkgrel=1
pkgdesc="Fast Indexed python2 HTML parser which builds a DOM node tree, providing common getElementsBy* functions for scraping, testing, modification, and formatting"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/AdvancedHTMLParser"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
optdepends=('python2-queryablelist: Support for advanced "filter" functions')
source=("https://github.com/kata198/AdvancedHTMLParser/archive/${pkgver}.tar.gz")
sha512sums=("25cc038b6f0ceb1662271162e54cab9fa384d8f8c486b0ab4051e9323b55091befef2f6aff55f10529e91a0c6a06ad17ce86576a237159c8a5160cfe8ff594ad")

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
