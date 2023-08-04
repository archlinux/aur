# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-xmind
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=2
pkgdesc="A one-stop solution for creating, parsing, and updating XMind files"
arch=(any)
url="https://github.com/zhuifengshen/xmind"
license=(MIT)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7524b447aa038e30c1b37b1a161494eb8af79b48629658493b4e0407dc50cc79')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
