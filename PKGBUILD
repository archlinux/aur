# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgbase=python-iso3166
pkgname=(python-iso3166 python2-iso3166)
_libname=iso3166
pkgver=0.9
pkgrel=1
pkgdesc="Self-contained ISO 3166-1 country definitions."
arch=('any')
url="https://github.com/deactivated/python-iso3166"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_libname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/f2/f6/985e5b174786e93aff77ec055a4b7ba55ebc95a3f8b5880f845d7bbd253e/iso3166-0.9.tar.gz")
sha256sums=('545a9dbf57b56acfa0dad7978cae2bdd8e0ef4c48cd8aab50c335f0d46eda042')

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
