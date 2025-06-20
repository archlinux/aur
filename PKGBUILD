# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-gguf
_pkgname=gguf
pkgver=0.17.1
pkgrel=1
pkgdesc="for writing binary files in the GGUF (GGML Universal File) format."
arch=('x86_64')
url='https://ggml.ai/'
license=(MIT)
depends=(python python-sentencepiece)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-poetry)
source=("https://files.pythonhosted.org/packages/source/g/gguf/gguf-${pkgver}.tar.gz")
sha256sums=('36ad71aad900a3e75fc94ebe96ea6029f03a4e44be7627ef7ad3d03e8c7bcb53')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  #python -m pytest -s -v tests # no tests
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
