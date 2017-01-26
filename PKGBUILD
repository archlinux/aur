# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgbase=python-iso3166
pkgname=(python-iso3166 python2-iso3166)
_libname=iso3166
pkgver=0.7
pkgrel=1
pkgdesc="Self-contained ISO 3166-1 country definitions."
arch=('any')
url="https://github.com/deactivated/python-iso3166"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_libname-$pkgver.zip::$url/archive/master.zip")
sha256sums=('462304b5eb53453d13c6ab2adb3d4a57aad01f4b190b01abc27af5ccede35f40')

prepare() {
  cp -a "$pkgbase-master"{,-python2}
}

build() {
  cd "$srcdir/$pkgbase-master"
  python setup.py build

  cd "$srcdir/$pkgbase-master-python2"
  python2 setup.py build
}

package_python-iso3166() {
  depends=('python')

  cd "$srcdir/$pkgbase-master"
  python setup.py install --skip-build -O1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_python2-iso3166() {
  depends=('python2')

  cd "$srcdir/$pkgbase-master-python2"
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
