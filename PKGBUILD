# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-collada
_pkgname=pycollada
pkgver=0.9.2
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
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('8194abcd4f1d2d1dd50f452f278c9b34a3e45b551ce9efe76ceb21f0c66c40e1')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  pytest --ignore=collada/tests/test_material.py \
         --ignore=collada/tests/test_ignore.py
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
# vim:set ts=2 sw=2 et:
