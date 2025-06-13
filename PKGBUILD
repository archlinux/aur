# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-datasketch
_pkgname=datasketch
pkgver=1.6.5
pkgrel=1
pkgdesc="Probabilistic data structures for processing and searching very large datasets"
arch=('any')
url='https://ekzhu.com/datasketch/'
license=(MIT)
depends=(python python-numpy python-scipy)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-poetry)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ekzhu/datasketch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0ffdc2dcb7db51891d09be141e8233398b17c64d456ebf375f36d64548611653')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  #PYTHONPATH=./datasketch python -m pytest
  #python -m pytest
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
