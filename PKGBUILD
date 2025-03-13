# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-cutlet
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=2
pkgdesc="Romaji converter"
arch=(any)
url="https://github.com/polm/cutlet"
license=(MIT)
depends=(
  python
  python-mojimoji
  python-jaconv
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)

source=("https://files.pythonhosted.org/packages/source/c/cutlet/cutlet-${pkgver}.tar.gz")
sha256sums=('5e8435ba2a46d3b4aa2468f7be6a39da3c33dcfafe8c5c7f976df343eb189927')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
