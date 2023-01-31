# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-environ-config
_name=${pkgname#python-}
pkgver=23.1.0
pkgrel=1
pkgdesc="Python Application Configuration With Environment Variables"
arch=(any)
url="https://github.com/hynek/environ-config"
license=(APACHE)
depends=(
  python
  python-attrs
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-moto
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('eb12641008c42c1dc8e1a5230536187ecb752c4779dd0b4ae7b72c82188b787a')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  PYTHONPATH=src/ python -m pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
