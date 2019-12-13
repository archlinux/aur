# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgbase=python-iso3166
pkgname=(python-iso3166 python2-iso3166)
pkgver=1.0.1
pkgrel=1
pkgdesc="Self-contained ISO 3166-1 country definitions."
arch=('any')
url="https://github.com/deactivated/python-iso3166"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fce7996caab1afdee49958e38440cdaa3816f5dd2532839ea01b5b7495ce74a3')

prepare() {
  cp -a "$pkgbase-$pkgver"{,-python2}
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py build

  cd "$srcdir/$pkgbase-$pkgver-python2"
  python2 setup.py build
}

package_python-iso3166() {
  depends=('python')

  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_python2-iso3166() {
  depends=('python2')

  cd "$srcdir/$pkgbase-$pkgver-python2"
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
