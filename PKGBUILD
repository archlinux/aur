# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=toolong
pkgver=1.0.2
pkgrel=1
pkgdesc="A terminal application to view, tail, merge, and search log files (plus JSONL)"
arch=(any)
url="https://github.com/Textualize/toolong"
license=(MIT)
depends=(
  python
  python-click
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
sha256sums=('0894a05dc9041d9914b05a0d97789397fa8916f5731251ea92fcb24e8ea99931')

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
