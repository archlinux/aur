# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-cached-property
pkgname=('python-cached-property' 'python2-cached-property')
pkgver=1.3.0
pkgrel=2
pkgdesc="A decorator for caching properties in classes"
arch=('any')
license=('BSD')
url="https://github.com/pydanny/cached-property"
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-pytest' 'python2-pytest' 'python-freezegun' 'python2-freezegun')
source=("git+https://github.com/pydanny/cached-property.git#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a cached-property{,-py2}
}

build() {
  cd "$srcdir/cached-property"
  python setup.py build

  cd "$srcdir/cached-property-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/cached-property"
  py.test

  cd "$srcdir/cached-property-py2"
  py.test2
}

package_python-cached-property() {
  depends=('python')

  cd cached-property
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-cached-property() {
  depends=('python2')

  cd cached-property-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
