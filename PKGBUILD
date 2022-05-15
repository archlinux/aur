# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-steam
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc="Python package for interacting with Steam"
arch=('any')
url="https://github.com/ValvePython/steam"
license=('MIT')
depends=('python' 'python-cachetools' 'python-pycryptodomex' 'python-requests'
         'python-six' 'python-vdf')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-gevent-eventemitter' 'python-google-api-python-client' 'python-mock'
              'python-protobuf' 'python-pytest-cov' 'python-vcrpy' 'python-yaml')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4fbdb35fb5d30e4e5884f30d20a62eb0d4d82de3b95749e682e70769c1437fb6')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  make test
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
