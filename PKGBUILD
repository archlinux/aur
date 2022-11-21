# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Dan Serban
# Contributor: Richard Murri

pkgname=python38-werkzeug
pkgver=2.2.2
pkgrel=1
pkgdesc='Swiss Army knife of Python web development'
url='https://werkzeug.palletsprojects.com/'
arch=('any')
license=('custom:BSD')
depends=('python38-markupsafe')
makedepends=('python38-setuptools' 'python38-build' 'python38-installer' 'python38-wheel')
checkdepends=('python38-pytest' 'python38-pytest-timeout' 'python38-pytest-xprocess' 'python38-requests'
              'python38-ephemeral-port-reserve' 'python38-greenlet' 'python38-watchdog'
              'python38-cryptography')
source=("https://github.com/pallets/werkzeug/archive/${pkgver}/$pkgname-$pkgver.tar.gz")
sha512sums=('cded6c7e0b00871366b70a41de45e31323c0fc09300413d0efca98f5a2f8207026fd77c7e5670fde727da377fd02b9b636f390a2524d2b5778e9e3bdbdfe3e3a')

build() {
  cd "werkzeug-$pkgver"

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "werkzeug-$pkgver"
  PYTHONPATH="build/lib" pytest \
    --deselect=tests/test_serving.py \
    --deselect=tests/test_debug.py::test_basic \
    --deselect=tests/middleware/test_http_proxy.py
}

package() {
  cd "werkzeug-$pkgver"

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
