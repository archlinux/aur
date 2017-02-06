# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgbase=python-iso3166
pkgname=(python-iso3166 python2-iso3166)
_libname=iso3166
pkgver=0.8
pkgrel=1
pkgdesc="Self-contained ISO 3166-1 country definitions."
arch=('any')
url="https://github.com/deactivated/python-iso3166"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_libname-$pkgver.tar.gz::https://pypi.python.org/packages/46/06/64145b8d6be8474db1f09f6b01a083921c11a4c979d029677c7e943d2433/$_libname-$pkgver.tar.gz#md5=9b7a42df80495fe253d6edd035974128")
sha256sums=('fbeb17bed90d15b1f6d6794aa2ea458e5e273a1d29b6f4939423c97640e14933')

prepare() {
  cp -a "$_libname-$pkgver"{,-python2}
}

build() {
  cd "$srcdir/$_libname-$pkgver"
  python setup.py build

  cd "$srcdir/$_libname-$pkgver-python2"
  python2 setup.py build
}

package_python-iso3166() {
  depends=('python')

  cd "$srcdir/$_libname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_python2-iso3166() {
  depends=('python2')

  cd "$srcdir/$_libname-$pkgver-python2"
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
