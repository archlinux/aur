# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgbase=python-iso3166
pkgname=(python-iso3166 python2-iso3166)
pkgver=1.0
pkgrel=2
pkgdesc="Self-contained ISO 3166-1 country definitions."
arch=('any')
url="https://github.com/deactivated/python-iso3166"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('060e12bcf8b5118aeaceadbc077c4a03085f71edeedcb39791b59f22add5d505')

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
