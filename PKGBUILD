# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=('python2-advancedhtmlparser' 'python2-advancedhtmlparser-tools')
pkgver=7.2.3
pkgrel=1
pkgdesc="Fast Indexed python2 HTML parser which builds a DOM node tree, providing common getElementsBy* functions for scraping, testing, modification, and formatting"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/AdvancedHTMLParser"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
optdepends=('python2-queryablelist: Support for advanced "filter" functions')
source=("https://github.com/kata198/AdvancedHTMLParser/archive/${pkgver}.tar.gz")
sha512sums=("9deecbb9566585a471c080fbbbc7b8aa4862f078c3d81a53ab4d91f79441095cb7910b136c1e2b144baaae3d6278ecd6d616f26bcb729e3a533b9449912147f5")

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
