# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-simple-pid
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=2
pkgdesc='A simple and easy to use PID controller in Python'
arch=(any)
url='https://github.com/m-lundberg/simple-pid'
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('29e54cc3e6bddd9103979a0ee1acdfb60e3bd85ef199b2a538144ec5e0c8ea45d4ce22615df618fdd920d0c0e04a50a844d598e9fc09c5873bb8d9c550548723')

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
