# Maintainer: envolution
# Contributor: Ankit Bhatia <ankbhatia19@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgbase='python-ultralytics'
pkgname=('python-ultralytics')
_module='ultralytics'
pkgver=8.3.58
_src_folder=${_module}-${pkgver}
pkgrel=2
pkgdesc="Ultralytics YOLOv8 for SOTA object detection, multi-object tracking, instance segmentation, pose estimation and image classification."
url="https://github.com/ultralytics/ultralytics"
depends=('python-matplotlib' 'python-opencv' 'python-pillow' 'python-requests' 'python-scipy' 'python-pytorch' 'python-torchvision' 'python-tqdm' 'python-psutil' 'python-py-cpuinfo' 'python-thop' 'python-pandas' 'python-seaborn' 'python-lapx')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('AGPL-3.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ultralytics/ultralytics/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('648d4d7b1ed05a8b32e24ece31b02875af0c4597b3b51dada508fbafd9a88c18')

build() {
  cd "${srcdir}/${_src_folder}"
  python -m build --wheel --no-isolation
}

package() {
  depends+=()
  cd "${srcdir}/${_src_folder}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  find $pkgdir -type d -name "tests" -exec rm -rf {} + #this was leaving a new drectory under site_packages called 'tests'
}
# vim:set ts=2 sw=2 et:
