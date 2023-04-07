# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=mmdetection
pkgname=python-mmdetection
pkgver=3.0.0
pkgrel=1
pkgdesc='OpenMMLab Detection Toolbox and Benchmark'
arch=('any')
url='https://github.com/open-mmlab/mmdetection'
license=('Apache')
depends=(
  python-mmcv
  python-numpy
  python-mmpycocotools
  python-pytorch
  python-terminaltables
  python-torchvision
)
makedepends=(
  numactl
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  python-albumentations
  python-cityscapesscripts
  python-imagecorruptions
  python-mmlvis
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/open-mmlab/mmdetection/archive/v${pkgver}.tar.gz")
sha512sums=('23db484d81ce55a868f2c460c363eb9d917ccc4391075304ffda59ec54f4d0023bbca4733350f706fe60044f43bf448aea11dc1bc4497e1e1188293681ab9f09')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # delete unused .mim dir
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rfv "${pkgdir}${site_packages}/mmdet/.mim"
}
# vim:set ts=2 sw=2 et:
