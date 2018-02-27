# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-cached-property
pkgname=('python-cached-property' 'python2-cached-property')
pkgver=1.4.0
pkgrel=1
pkgdesc="A decorator for caching properties in classes"
arch=('any')
license=('BSD')
url="https://github.com/pydanny/cached-property"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest' 'python-freezegun' 'python2-freezegun')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/pydanny/cached-property/archive/$pkgver.tar.gz")
sha512sums=('63b677b0dcd8ce358cb8536a30a9197990ccf9f69cc91b693ce28e7ad10c95b3e60354521e4a0187d91893bf80636c09d490d95733d3392a4982be8246f17dfb')

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
