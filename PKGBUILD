# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-cached-property
pkgname=('python-cached-property' 'python2-cached-property')
pkgver=1.5.1
pkgrel=1
pkgdesc="A decorator for caching properties in classes"
arch=('any')
license=('BSD')
url="https://github.com/pydanny/cached-property"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest' 'python-freezegun' 'python2-freezegun')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/pydanny/cached-property/archive/$pkgver.tar.gz")
sha512sums=('d6c2cd35d7781e3123c7c076681c0dbfd352b24f71b87e1689b304a5a65759d3f7a27e46a1ce5fe1571cbe6c0dc4981b1eb5eb8314b76b13aa15eb8429645a43')

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
