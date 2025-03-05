# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-pybrowsers
_pkgname=browsers
pkgver=0.7.0
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
sha256sums=('a6b34aaf3e47d5a871a12f94829a44d884e259370e230eeedeb948d3f0bd7ef9')

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
