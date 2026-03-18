# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-sgl-kernel
_pkgname=sgl-kernel
pkgver=0.3.21
pkgrel=1
pkgdesc='Compiled CUDA kernels for the SGLang serving framework'
arch=('x86_64')
url='https://github.com/sgl-project/sglang/tree/main/sgl-kernel'
license=('Apache-2.0')
depends=(
  'python>=3.10'
  'python-pytorch-cuda'
  'cuda'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-scikit-build-core'
  'cmake'
  'ninja'
  'git'
)
options=('!strip')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/sgl-project/sglang/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5905242df108f4b6be1784192e7a9d0504e6251872d497a61cfc1fac2410bbad')

build() {
  cd "sglang-${pkgver}/${_pkgname}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "sglang-${pkgver}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
