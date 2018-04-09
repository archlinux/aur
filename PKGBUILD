# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-cached-property
pkgname=('python-cached-property' 'python2-cached-property')
pkgver=1.4.2
pkgrel=1
pkgdesc="A decorator for caching properties in classes"
arch=('any')
license=('BSD')
url="https://github.com/pydanny/cached-property"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest' 'python-freezegun' 'python2-freezegun')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/pydanny/cached-property/archive/$pkgver.tar.gz")
sha512sums=('dbe24114ab986ed8c3c5dad766d7c1c0ce87bbcc0ebfbba2505fc2878358239df09b92d3fbcbaa5cfde264d4f4b9c305b5f5216a6e9158d3872e5837bd581c6f')

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
