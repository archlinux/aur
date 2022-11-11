# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-steam
_name=${pkgname#python-}
pkgver=1.4.3
pkgrel=1
pkgdesc="Python package for interacting with Steam"
arch=('any')
url="https://github.com/ValvePython/steam"
license=('MIT')
depends=('python' 'python-cachetools' 'python-pycryptodomex' 'python-requests'
         'python-six' 'python-vdf')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-gevent-eventemitter' 'python-google-api-python-client' 'python-mock' ## TODO: Drop python-mock: https://archlinux.org/todo/drop-python-mock-checkdepends/
              'python-protobuf' 'python-pytest-cov' 'python-vcrpy' 'python-yaml')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('249714083d156df107f103d1cb5ad9dfd690de7adbfc45984e6513c18f0cbdf2')

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
