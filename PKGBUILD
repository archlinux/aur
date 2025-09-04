# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-pybrowsers
_pkgname=browsers
pkgver=1.3.1
pkgrel=1
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
sha256sums=('4fc7020d1b95545121ebed87d4e557f79bb9dbe43cf2387b4483f95ef99ea4a3')

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
