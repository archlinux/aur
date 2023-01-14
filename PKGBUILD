# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

_repo="InterDigitalInc/CompressAI-Vision"
_repo_name="CompressAI-Vision"
_source_type=github-tags
_upstreamver='v0.1.3'
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="A platform for Video Compression for Machines (VCM) pipelines"
arch=(x86_64)
url=https://github.com/$_repo
depends=(
  ipython
  jupyterlab
  pybind11
  python-compressai
  python-detectron2-cuda
  python-fiftyone
  python-pytorch-msssim
  python-torchvision
)
makedepends=(
  python-setuptools
)
license=(BSD)
source=("https://github.com/${_repo}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/${_repo_name}-$pkgver" || return 1
  python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
