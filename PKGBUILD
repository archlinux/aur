# Maintainer: Felix2086 <Felix-LIKE@users.noreply.github.com>
#
# python-pybioclip is the only dependency of the offline bird-ID pipeline
# (birdid-git) that is missing from the official repos and the AUR. The rest
# of the chain already exists:
#   python-pytorch, python-torchvision, python-pandas, python-prettytable (extra)
#   python-open-clip-torch (AUR)
# Builds the PyPI sdist with python-build/python-installer (hatchling backend;
# the version comes from src/bioclip/__about__.py, so no VCS/tags needed).

pkgname=python-pybioclip
pkgver=2.1.6
pkgrel=1
pkgdesc='Python package that simplifies using the BioCLIP foundation model'
arch=('any')
url='https://github.com/Imageomics/pybioclip'
license=('MIT')
depends=(
  'python-open-clip-torch'
  'python-pandas'
  'python-prettytable'
  'python-pytorch'
  'python-torchvision'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
source=("pybioclip-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pybioclip/pybioclip-$pkgver.tar.gz")
sha256sums=('eb7a74a0e8b47dd729cf0f848ae3e65bdda75872c62f4286a75ce9b28ba3f607')

build() {
  cd "pybioclip-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "pybioclip-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
