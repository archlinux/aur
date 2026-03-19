# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-nvidia-cudnn-frontend
_pkgname=cudnn-frontend
pkgver=1.20.0
pkgrel=1
pkgdesc='Python frontend for NVIDIA cuDNN Graph API and open-source kernels'
arch=('x86_64')
url='https://github.com/NVIDIA/cudnn-frontend'
license=('LicenseRef-NVIDIA-Proprietary')
depends=(
  'python'
  'cudnn'
  'cuda'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=64'
  'pybind11>=2.13'
  'python-ninja'
  'cmake>=3.18'
  'gcc'
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
