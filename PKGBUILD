# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=toolong
pkgver=1.3.0
_commit=c5ff45c6471d76651bea60fd98b00161ad5a1036
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
sha256sums=('add7fc98cca6079e06af5b947205c972aab7254d2930ae14608e9635bf6ccd3c')

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
