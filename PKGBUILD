# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov

pkgname=python-tarantool
pkgver=0.6.6.r25.gb267643
_commit=b267643a242e2e6abc013539395b89dd235b798f
pkgrel=4
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=('any')
url='https://github.com/tarantool/tarantool-python'
license=('BSD')
depends=('python' 'python-msgpack' 'python-yaml' 'python-six')
makedepends=('python-setuptools' 'git')
checkdepends=('tarantool')
#source=("https://pypi.io/packages/source/t/tarantool/tarantool-$pkgver.tar.gz")
source=("git+https://github.com/tarantool/tarantool-python#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd tarantool-$pkgver
  git describe | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mv tarantool-python tarantool-$pkgver
  sed -i 's/msgpack-python/msgpack/g' tarantool-$pkgver/setup.py
}

build() {
  cd tarantool-$pkgver
  python setup.py build
}

check() {
  cd tarantool-$pkgver
  python setup.py test
}

package() {
  cd tarantool-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
