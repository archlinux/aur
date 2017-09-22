# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-cached-property
pkgname=('python-cached-property' 'python2-cached-property')
pkgver=1.3.1
pkgrel=1
pkgdesc="A decorator for caching properties in classes"
arch=('any')
license=('BSD')
url="https://github.com/pydanny/cached-property"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest' 'python-freezegun' 'python2-freezegun')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/pydanny/cached-property/archive/$pkgver.tar.gz")
sha512sums=('81a52272ab348d17c2e6d29ae8fc48d5ed8fc2a8585a161fecbc5199f323a42a3dd14281e6986fe525006bd8ab9453c34074b6a2ab77bfbfdd757d66fbdcfd1d')

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
