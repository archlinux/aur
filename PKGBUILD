# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Ben Wolsieffer <benwolsieffer@gmail.com>

pkgname=python-port-for
_name=${pkgname#python-}
pkgver=0.7.1
pkgrel=1
pkgdesc="Command-line utility and a python library that helps with local TCP ports managment"
arch=(any)
url="https://github.com/kmike/port-for"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=(python-pytest)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1f60db6229a87c7719fdc6454e09b9d2181ada65c03c2c2ca64086cc45d7e5ad')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
