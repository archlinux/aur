# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=python-plover_stroke
pkgdesc="Helper class for working with steno strokes."
pkgver=1.1.0
pkgrel=2
arch=('any')
license=('GPL2')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-pytest'
  'python-setuptools'
  'python-wheel'
)
url="https://github.com/benoit-pierre/plover_stroke"
source=("$pkgname-$pkgver.tar.gz::https://github.com/benoit-pierre/plover_stroke/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9c5e01ff594a822424562dd12c60aa0dfc66eb4a0060a16c57c7ab12f04825c4')

build() {
  cd "plover_stroke-$pkgver"
  pyproject-build --no-isolation --skip-dependency-check --wheel
}

check() {
  cd "plover_stroke-$pkgver"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')" pytest test
}

package() {
  cd "plover_stroke-$pkgver"
  python -m installer --destdir="$pkgdir" --compile-bytecode=1 dist/*.whl
  chmod og+rX -R "$pkgdir"
}

# vim:set sw=2 sts=2 et:
