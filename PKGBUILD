# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-gguf
_pkgname=gguf
pkgver=0.10.0
pkgrel=2
pkgdesc="for writing binary files in the GGUF (GGML Universal File) format."
arch=('x86_64')
url='https://ggml.ai/'
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/0e/c4/a159e9f842b0e8b8495b2689af6cf3426f002cf01207ca8134db82fc4088/gguf-${pkgver}.tar.gz")
sha256sums=('52a30ef26328b419ffc47d9269fc580c238edf1c8a19b5ea143c323e04a038c1')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

#check() {
#  cd $_pkgname-$pkgver
# python -m pytest -s -v tests
# tests work, but a not of them need disabling due to external services
#}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
