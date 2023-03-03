# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-safetensors
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple, safe way to store and distribute tensors"
arch=('x86_64')
url="https://github.com/huggingface/safetensors"
license=('Apache')
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools-rust')
optdepends=('python-jax: for safetensors.flax'
            'python-numpy: for safetensors.numpy'
            'python-tensorflow: for safetensors.tensorflow'
            'python-pytorch: for safetensors.torch')
checkdepends=('python-pytorch'
              'python-numpy'
              'python-tensorflow'
              'python-jax'
              'python-flax'
              'python-black'
              'python-isort'
              'flake8'
              'python-click'
              'python-huggingface-hub'
              'python-pytest'
              'python-pytest-benchmark')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2843c198f11b18e60f4fa90d76d966999411bdda03ac0015a509da8a954241ae6539c55631248db07657e291e2208ac72e9e7c446466648f9b09a99b730af4c9')

build() {
  cd "safetensors-${pkgver}/bindings/python"
  python -m build --wheel --no-isolation
}

check() {
  cd "safetensors-${pkgver}/bindings/python"
  pytest tests/
}

package() {
  cd "safetensors-${pkgver}/bindings/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
