# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov

pkgname=python-tarantool
pkgver=0.9.0
pkgrel=6
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=('any')
url='https://github.com/tarantool/tarantool-python'
license=('BSD')
depends=('python-msgpack')
makedepends=('python-setuptools')
checkdepends=('tarantool' 'python-dbapi-compliance' 'python-yaml')
source=("https://github.com/tarantool/tarantool-python/archive/$pkgver/$pkgname-$pkgver.tar.gz"
	"unittest-alias-removal.patch")
sha512sums=('180c2f677177eef4e8afc882d08dc9556faab914c37521666a294e31373d3f6ff001b347f50a17fcc13afb033c84f759933f11045a4b3823d0aba2b407dc1805'
            '9254ebea6009efd0bc124f1ced7606eb0d844b699cc07256678d30a69ccfbe0dc99fee2abc30b874b36f353d4444cf1b189590bab103503d6dc354ab856e13da')

prepare() {
  cd tarantool-python-$pkgver
  patch -Np1 -i ${srcdir}/unittest-alias-removal.patch
}

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
