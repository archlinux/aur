# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname=python2-pytest
pkgver=4.6.11
pkgrel=1
pkgdesc="Simple powerful testing with Python"
arch=('any')
license=('MIT')
url="https://pytest.org/"
depends=('python2-py' 'python2-setuptools' 'python2-pluggy' 'python2-attrs' 'python2-more-itertools'
         'python2-atomicwrites' 'python2-wcwidth' 'python2-funcsigs' 'python2-pathlib2'
         'python2-importlib-metadata')
makedepends=('python2-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pytest-dev/pytest/archive/$pkgver.tar.gz")
sha512sums=('2be8549c67573c8544366198ef94f74e0aacfa5b321705a7262c069de7e532f7d29ab93ee69be6cc83828aad91af23eb9b8b7cf01d02c0badf488ef841ee4880')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pytest-$pkgver
  python2 setup.py build
}

package() {
  cd pytest-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  mv "$pkgdir"/usr/bin/py.test{,2}
  mv "$pkgdir"/usr/bin/pytest{,2}
}
