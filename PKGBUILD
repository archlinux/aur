# Maintainer: envolution
# Contributor: Ankit Bhatia <ankbhatia19@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=('python-ultralytics')
_pkgname='ultralytics'
pkgver=8.3.228
_pkgdir=${_pkgname}-${pkgver}
pkgrel=1
pkgdesc="Object detection, multi-object tracking, instance segmentation, pose estimation and image classification."
url="https://github.com/ultralytics/ultralytics"
depends=(
  'python'
  'python-matplotlib'
  'python-opencv'
  'python-pillow'
  'python-requests'
  'python-scipy'
  'python-pytorch'
  'python-torchvision'
  'python-tqdm'
  'python-psutil'
  'python-py-cpuinfo'
  'python-thop'
  'python-pandas'
  'python-seaborn'
  'python-lapx'
  'python-sentry_sdk'
  'python-flatbuffers'
  'yt-dlp'
  'python-onnx'
  'python-tensorflow')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=(ipython)
license=('AGPL-3.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ultralytics/ultralytics/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('60cc966aa8839bd6f3fe4ad32c232eeffca3f2a066b6840f0b67bcaa3bbd514c')

build() {
  cd "${_pkgdir}"
  python -m build --wheel --no-isolation
}

package() {
  depends+=()
  cd "${_pkgdir}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # ultralytics whl leaves a drectory under site_packages called 'tests'
  local _site_packages=$(python -c "import sysconfig; print(sysconfig.get_paths()['purelib'])")
  rm -rf "${pkgdir}${_site_packages}/tests"
}
# vim:set ts=2 sw=2 et:
