# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: GI Jack <GI_Jack@hackermail.com>\

pkgname=python-rich-click
_name=${pkgname#python-}
pkgver=1.7.3
pkgrel=2
pkgdesc="Python module to format click help output nicely with Rich."
arch=(any)
url="https://github.com/ewels/rich-click"
license=(MIT)
depends=(
  python
  python-click
  python-rich
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a55419359e4b30da0cf3156977885b784530edaf648030f509acb165fb8fb589')

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

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
