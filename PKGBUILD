# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Ben Wolsieffer <benwolsieffer@gmail.com>

pkgname=python-port-for
_pkgname=${pkgname#python-}
pkgver=0.7.3
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c19259a6a898195062307f5ea07fc3ca577166f87dc493a72e9bd74f236c43a3')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
