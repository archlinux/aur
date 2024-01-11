# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=mmpose
pkgname=python-mmpose
pkgver=1.3.1
pkgrel=1
pkgdesc='OpenMMLab Pose Estimation Toolbox and Benchmark'
arch=('any')
url='https://github.com/open-mmlab/mmpose'
license=('Apache')
depends=(
  python-chumpy
  python-json-tricks
  python-matplotlib
  python-mmcv
  python-munkres
  python-numpy
  python-opencv
  python-pillow
  python-pytorch
  python-torchvision
  python-xcocotools
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  python-albumentations
  python-onnx
  python-onnxruntime
  python-requests
  python-trimesh
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/open-mmlab/mmpose/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c3a77afe991927af817ed8b05402bac8e2919c4f2cf3cb315b04698c85f815beb50221c93edf22c778b86d15d6d68d7901d6550852d269d07e09f98ca14d601e')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  # delete unused .mim and tests dir
  rm -rfv "${pkgdir}${site_packages}/mmpose/.mim"
  rm -rfv ${pkgdir}${site_packages}/tests
}
# vim:set ts=2 sw=2 et:
