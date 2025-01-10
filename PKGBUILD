# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-gguf
_pkgname=gguf
pkgver=0.14.0
pkgrel=1
pkgdesc="for writing binary files in the GGUF (GGML Universal File) format."
arch=('x86_64')
url='https://ggml.ai/'
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/g/gguf/gguf-${pkgver}.tar.gz")
sha256sums=('d9996f197a777831cf9e01efac24cbfa817787375305b8c4ee16074778e2bce8')

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
