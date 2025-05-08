# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-pybrowsers
_pkgname=browsers
pkgver=0.10.0
pkgrel=2
pkgdesc="Python library for detecting and launching browsers"
arch=(any)
url="https://github.com/roniemartinez/browsers"
license=(MIT)
depends=(
  python
  python-pyxdg
)
makedepends=(
  python-build
  python-installer
  python-poetry
  python-wheel
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7bd5d8a80acdade18c3d6827277fb557e91e63a7922f06f942bd80cb1fec69d4')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
