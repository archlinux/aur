# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgbase=python-iso639
pkgname=(python-iso639 python2-iso639)
_libname=iso639
pkgver=0.4.5
pkgrel=3
pkgdesc="Python library for ISO 639 standard"
arch=('any')
url="https://github.com/noumar/iso639"
license=('AGPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_libname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e68347887a438a0c49e6fe053206bf5d40348c4624f5ccffadc8bed2fa5e8ac9')

prepare() {
  cp -a "$_libname-$pkgver"{,-python2}
}

build() {
  cd "$srcdir/$_libname-$pkgver"
  python setup.py build

  cd "$srcdir/$_libname-$pkgver-python2"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_libname-$pkgver"
  python setup.py test || warning "Tests failed"

  cd "$srcdir/$_libname-$pkgver-python2"
  python2 setup.py test || warning "Tests failed"
}

package_python-iso639() {
  depends=('python')

  cd "$srcdir/$_libname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}

package_python2-iso639() {
  depends=('python2')

  cd "$srcdir/$_libname-$pkgver-python2"
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
