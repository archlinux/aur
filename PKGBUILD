# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>
pkgname=python2-pytest
pkgver=4.6.11
pkgrel=2
pkgdesc="Simple powerful testing with Python"
arch=('any')
license=('MIT')
url="https://pytest.org/"
depends=('python2-py' 'python2-setuptools' 'python2-pluggy' 'python2-attrs' 'python2-more-itertools'
         'python2-atomicwrites' 'python2-wcwidth' 'python2-funcsigs' 'python2-pathlib2'
         'python2-importlib-metadata' 'python2-packaging')
makedepends=('python2-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pytest-dev/pytest/archive/$pkgver.tar.gz")
b2sums=('de50a9ea274aaffc5eca402c61f66ec89a0e562a9ad022cdc13bf091535c79f9eda9889d495d03818487d7ebd383bee3a8d8dd5ecde518ffba25bcdc5830eda7')

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
