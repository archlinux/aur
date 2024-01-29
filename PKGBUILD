# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=python-xvfbwrapper
_pkgname=${pkgname#python-}
pkgver=0.2.9
pkgrel=11
pkgdesc="Manage headless displays with Xvfb (X virtual framebuffer)"
arch=(any)
url="https://github.com/cgoldberg/xvfbwrapper"
license=(MIT)
depends=(
  python
  xorg-server-xvfb
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7b991de03fad1dd0e50d814e3cb3588fb69011d91320f32155d5422c83385788')

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

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
