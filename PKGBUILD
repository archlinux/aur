# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-simple-pid
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc='A simple and easy to use PID controller in Python'
arch=(any)
url='https://github.com/m-lundberg/simple-pid'
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('bb4ae86678e19f096b8d53d186451a1776dae1579a4eb1b067f89a9f38fe5066cfb871bc262c016cc29bdc7f1ca296cb8470f0d13c461dd3ee1b0eca01c68346')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv --deselect tests/test_pid.py::test_converge_system
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
