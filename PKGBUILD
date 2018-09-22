# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=('python-advancedhtmlparser' 'python-advancedhtmlparser-tools')
pkgver=8.0.1
pkgrel=2
pkgdesc="Fast Indexed python HTML parser which builds a DOM node tree, providing common getElementsBy* functions for scraping, testing, modification, and formatting"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/AdvancedHTMLParser"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
optdepends=('python-queryablelist: Support for advanced "filter" functions')
source=("https://github.com/kata198/AdvancedHTMLParser/archive/${pkgver}.tar.gz")
sha512sums=("3ad59802fa1868912f37fe7cf688b6ea9d521a93806bb1985f7b07d3a8c5cc513bf3ac977d36cf2e59b652fccc53c713b01431169b4e356e551324c86a388c2b")

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
