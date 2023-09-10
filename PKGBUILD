# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=dotbot
pkgver=1.20.0
pkgrel=1
pkgdesc="A tool that bootstraps your dotfiles"
arch=(any)
url="https://github.com/anishathalye/dotbot"
license=(MIT)
depends=(
  python
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1cb97932fa0e16fd7ae454f70985a967f8db753d7d9f455b2f07b2bbe22694d')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest --ignore tests/test_shim.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
