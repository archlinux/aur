# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov

pkgbase=python-tarantool
pkgname=(python-tarantool python2-tarantool)
pkgver=0.6.1
pkgrel=2
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=('any')
url='https://github.com/tarantool/tarantool-python'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-msgpack' 'python2-msgpack'
             'python-yaml' 'python2-yaml' 'python-six' 'python2-six')
source=("https://pypi.io/packages/source/t/tarantool/tarantool-$pkgver.tar.bz2")
sha512sums=('8565bce244b399c37308a78bc1e6bfc23ad6b75fa334be0df2c7d6723d048917d55e272cdd1f1dc5b2771da2ce3102b2d292472159a89aaca5d23137d7783006')

prepare() {
  sed -i 's/msgpack-python/msgpack/g' tarantool-$pkgver/setup.py
  cp -a tarantool-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/tarantool-$pkgver
  python setup.py build

  cd "$srcdir"/tarantool-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/tarantool-$pkgver
  python setup.py test

  cd "$srcdir"/tarantool-$pkgver-py2
  python2 setup.py test
}

package_python-tarantool() {
  depends=('python' 'python-msgpack' 'python-yaml' 'python-six')

  cd tarantool-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-tarantool() {
  depends=('python2' 'python2-msgpack' 'python2-yaml' 'python2-six')

  cd tarantool-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
