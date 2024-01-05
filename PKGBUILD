# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Ben Wolsieffer <benwolsieffer@gmail.com>

pkgname=python-port-for
_name=${pkgname#python-}
pkgver=0.7.2
pkgrel=2
pkgdesc="Command-line utility and a python library that helps with local TCP ports managment"
arch=(any)
url="https://github.com/kmike/port-for"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('09bb11a7dd346d2b0f971890cbb20c8545ccdc4ccc37d2f5bf81736604e5a275')

_archive="$_name-$pkgver"

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

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
