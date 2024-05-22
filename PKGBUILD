# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-collada
_pkgname=pycollada
pkgver=0.8
pkgrel=1
pkgdesc="A python COLLADA library"
arch=(any)
url="https://github.com/pycollada/pycollada"
license=(BSD-3-Clause)
depends=(
  python
  python-dateutil
  python-lxml
  python-numpy
  python-pillow
  python-setuptools
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0ed3d422c2e287c187a6f744ad9db2d3bfef69f72d3666d037f1e01a245f5cbc')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
