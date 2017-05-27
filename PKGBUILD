# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov

pkgbase=python-tarantool
pkgname=(python-tarantool python2-tarantool)
pkgver=0.5.5
pkgrel=1
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=('any')
url='https://github.com/tarantool/tarantool-python'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-msgpack' 'python2-msgpack' 
             'python-yaml' 'python2-yaml' 'python-six' 'python2-six')
source=("https://pypi.io/packages/source/t/tarantool/tarantool-$pkgver.tar.gz")
sha512sums=('b01265e2e662ad3ea321f6ca06369d005a18e92bcb72764a5d83aa3858118436fad69478235fcc80f5ecc365b4e5c98bab8ce49c98afd49849db4898ae76844d')

prepare() {
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
