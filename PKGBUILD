# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=toolong
pkgver=1.0.3
pkgrel=2
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
sha256sums=('a3db4deaa777a81ee6b508ca644de0639b0dbe83c43f413fe813529d38c9f2f6')

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
