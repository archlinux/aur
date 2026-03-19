# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-flashinfer
_pkgname=flashinfer
pkgver=0.6.6
pkgrel=1
pkgdesc='Kernel Library for LLM Serving'
arch=('x86_64')
url='https://github.com/flashinfer-ai/flashinfer'
license=('Apache-2.0')
provides=('python-flashinfer')
conflicts=('python-flashinfer-rocm')
depends=(
  'python-pytorch'
  'cuda'
  'python-cuda'
  'python-tvm-ffi'
  'python-click'
  'python-einops'
  'python-ninja'
  'python-numpy'
  'python-nvidia-ml-py'
  'python-packaging'
  'python-requests'
  'python-tabulate'
  'python-tqdm'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=77'
)
optdepends=(
  'python-cutlass: Blackwell GPU kernel support (SM100+)'
  'cudnn: cuDNN-accelerated attention paths (pip install nvidia-cudnn-frontend for Python bindings)'
)
options=('!strip')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
