# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=('python-advancedhtmlparser' 'python-advancedhtmlparser-tools')
pkgver=8.1.6
pkgrel=2
pkgdesc="Fast Indexed python HTML parser which builds a DOM node tree, providing common getElementsBy* functions for scraping, testing, modification, and formatting"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/AdvancedHTMLParser"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
optdepends=('python-queryablelist: Support for advanced "filter" functions')
source=("https://github.com/kata198/AdvancedHTMLParser/archive/${pkgver}.tar.gz")
sha512sums=("5d3e331935bb28624efe13316620a0e41f4a39eff4ec000dba81f716b17a6b15ee3afaf6db915f7db9f635a699f490a721858dd0480186f1cb871fc3d29db3a7")

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
