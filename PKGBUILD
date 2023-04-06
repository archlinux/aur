# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov

pkgname=python-tarantool
pkgver=0.9.0
pkgrel=3
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=('any')
url='https://github.com/tarantool/tarantool-python'
license=('BSD')
depends=('python-msgpack')
makedepends=('python-setuptools')
checkdepends=('tarantool' 'python-dbapi-compliance' 'python-yaml')
source=("https://github.com/tarantool/tarantool-python/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('180c2f677177eef4e8afc882d08dc9556faab914c37521666a294e31373d3f6ff001b347f50a17fcc13afb033c84f759933f11045a4b3823d0aba2b407dc1805')

build() {
  cd tarantool-python-$pkgver
  python setup.py build
}

check() {
  cd tarantool-python-$pkgver
  make testdata
  make test
}

package() {
  cd tarantool-python-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
