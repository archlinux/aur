# Maintainer: ZaZam <zazaamm át gmail dt com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-attrs17
pkgname=('python-attrs17' 'python2-attrs17')
pkgver=17.4.0
pkgrel=1
pkgdesc="Attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://attrs.readthedocs.org/"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-zope-interface'
              'python2-zope-interface' 'python-hypothesis' 'python2-hypothesis')
provides=("python-attrs=$pkgver")
conflicts=('python-attrs')
source=("https://pypi.io/packages/source/a/attrs/attrs-$pkgver.tar.gz")
sha512sums=('b631cd5af1be7c78175230363a3cf9d37cb0237d87b24f994812b5734985d114708d5bf7ee5d92b8b13c6b8daa313efde4a9f60f0630df0b62bbcf4928a016ff')

prepare() {
  cp -a attrs-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/attrs-$pkgver
  python setup.py build
 
  cd "$srcdir"/attrs-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/attrs-$pkgver
  python setup.py pytest

  cd "$srcdir"/attrs-$pkgver-py2
  python2 setup.py pytest
}
 
package_python-attrs17() {
  depends=('python')
 
  cd attrs-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
 
package_python2-attrs17() {
  depends=('python2')
 
  cd attrs-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
