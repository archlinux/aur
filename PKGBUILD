# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov

pkgbase=python-tarantool
pkgname=(python-tarantool python2-tarantool)
pkgver=0.6.4
pkgrel=3
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=('any')
url='https://github.com/tarantool/tarantool-python'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-msgpack' 'python2-msgpack'
             'python-yaml' 'python2-yaml' 'python-six' 'python2-six')
source=("https://pypi.io/packages/source/t/tarantool/tarantool-$pkgver.tar.gz")
sha512sums=('19f1814673e56715e5dfe8c02a8e299c1407bfd98ea89c5c86781ec156357f401b7eed94148097e48c739bc803d4805eec1dd91b254d1f76b8000d9bdd9301b7')

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
