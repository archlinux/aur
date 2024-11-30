# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-compressed-tensors
_pkgname=compressed-tensors
pkgver=0.8.0
pkgrel=1
pkgdesc="extends the safetensors format, providing a versatile and efficient way to store and manage compressed tensor data"
arch=('x86_64')
url='https://github.com/neuralmagic/compressed-tensors'
license=(Apache-2.0)
depends=(python python-pytorch python-safetensors)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(jupyter-nbformat)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/neuralmagic/compressed-tensors/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1b890082edfd94ed37b1469cc1c703512643a827406b58954639030ef4f854f5')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}
check() {
  cd $_pkgname-$pkgver
  python -m pytest tests
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
