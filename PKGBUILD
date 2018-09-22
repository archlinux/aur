# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=('jsontocsv' 'python-jsontocsv')
_realName='jsonToCsv'
pkgver=1.0.1
pkgrel=2
pkgdesc="Extract data from json and convert to CSV"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/jsonToCsv"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/jsonToCsv/archive/${pkgver}.tar.gz")
sha512sums=("003671c2e50e7b45621494a5edb34171db829ee74f5471381fb3173cd546d35609eb38fa392315352f90da6b809fbdc1cc839b724a456335d60cb90c9598725a")

build() {
  cd "$srcdir/${_realName}-$pkgver"
  python setup.py build
}

package_python-jsontocsv() {
  pkgdesc="Python3 lib to extract data from json and convert to CSV"
  cd "${_realName}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove tools from lib package
  rm -Rf "$pkgdir/usr/bin"
}
package_jsontocsv() {
  depends=('python' 'python-setuptools' 'python-jsontocsv')
  cd "${_realName}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove lib from tools package
  rm -Rf "${pkgdir}/usr/lib"
}
