# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-steam
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
pkgdesc="Python package for interacting with Steam"
arch=('any')
url="https://github.com/ValvePython/steam"
license=('MIT')
depends=('python' 'python-cachetools' 'python-pycryptodomex' 'python-requests'
         'python-six' 'python-vdf')
makedepends=('python-setuptools')
checkdepends=('python-gevent-eventemitter' 'python-google-api-python-client' 'python-mock'
              'python-protobuf' 'python-pytest-cov' 'python-vcrpy' 'python-yaml')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('13744875373663892f0f39dcf63180c5a73404ab5634cf6fc6c3f7de8f87ea39')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  make test
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
