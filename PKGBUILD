# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=('python-advancedhtmlparser' 'python-advancedhtmlparser-tools')
pkgver=7.3.1
pkgrel=1
pkgdesc="Fast Indexed python HTML parser which builds a DOM node tree, providing common getElementsBy* functions for scraping, testing, modification, and formatting"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/AdvancedHTMLParser"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
optdepends=('python-queryablelist: Support for advanced "filter" functions')
source=("https://github.com/kata198/AdvancedHTMLParser/archive/${pkgver}.tar.gz")
sha512sums=("651f7b1c80879a0817fc5cc62b158b53d7b580658ca555cc0f8ba5309547c475e27a391056ea78dba536fa8aef5b35ee08a85262b43a7821e2b2c2d8c3bd3724")

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
