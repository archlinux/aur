# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ronan Pigott <rpigott@berkeley.edu>

pkgname=python-pypresence
_name=${pkgname#python-}
pkgver=4.3.0
pkgrel=1
pkgdesc='Discord RPC and Rich Presence wrapper library'
url='https://github.com/qwertyquerty/pypresence'
arch=(any)
license=(BSD)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-sphinx
  python-wheel
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('958a5bb2f28c3120c89c68cc242abd8e72e2dac9aaf9be36b7c7a6217dcf4669')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation

  sphinx-build -b man docs/sphinx man
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "man/$_name.1" -t "$pkgdir/usr/share/man/man1/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
