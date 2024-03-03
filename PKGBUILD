# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=toolong
pkgver=1.4.0
_commit=906dafb654bf106de49f2b9fc02e20bd6574beb4
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('135e9043e0da24880c4f3975d44f9f5c47e8f4427514c58c46d455fef0a15409')

_archive="$pkgname-$_commit"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
