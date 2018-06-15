# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-cached-property
pkgname=('python-cached-property' 'python2-cached-property')
pkgver=1.4.3
pkgrel=1
pkgdesc="A decorator for caching properties in classes"
arch=('any')
license=('BSD')
url="https://github.com/pydanny/cached-property"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest' 'python-freezegun' 'python2-freezegun')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/pydanny/cached-property/archive/$pkgver.tar.gz")
sha512sums=('d2a4d7239c0208866616a7c0c418ff145de541a1abaa53ba11862a3c133b7bc8c1e5c34a5b0b10381cc5ac89d27a83bc5caa9f0a066c9806cd7b96d5249ea075')

prepare() {
  cp -a cached-property-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/cached-property-$pkgver
  python setup.py build

  cd "$srcdir"/cached-property-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/cached-property-$pkgver
  py.test

  cd "$srcdir"/cached-property-$pkgver-py2
  py.test2
}

package_python-cached-property() {
  depends=('python')

  cd cached-property-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-cached-property() {
  depends=('python2')

  cd cached-property-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
