# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=toolong
pkgver=1.5.0
_commit=5aa22ee878026f46d4d265905c4e1df4d37842ae
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
sha256sums=('2a7f6984b9e49bd9ee769a9a4b671801c5cc83608061abdbc46b108b5c8bff0f')

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
