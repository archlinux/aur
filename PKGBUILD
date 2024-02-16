# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=toolong
pkgver=1.1.1
pkgrel=1
pkgdesc="A terminal application to view, tail, merge, and search log files (plus JSONL)"
arch=(any)
url="https://github.com/Textualize/toolong"
license=(MIT)
depends=(
  python
  python-click
  python-linkify-it-py
  python-rich
  python-textual
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('254491a0ce9fcc7e8ccce9ee697fe42af93400c547815908bbd907332a3eb543')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
