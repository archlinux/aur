# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: redponike <redponike@proton.me>
# Contributor: Alex Hirzel <alex@hirzel.us>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-pytorch-lightning
_pkgname=pytorch_lightning
pkgver=2.6.5
pkgrel=1
pkgdesc="The lightweight PyTorch wrapper for high-performance AI research"
arch=('any')
url='https://lightning.ai'
license=('Apache-2.0')
depends=(
  'python-fsspec'
  'python-lightning-utilities'
  'python-packaging'
  'python-pytorch'
  'python-torchmetrics'
  'python-tqdm'
  'python-typing_extensions'
  'python-yaml'
)
optdepends=(
  'python-aiohttp: for fsspec http filesystem support'
  'python-bitsandbytes: for quantization'
  'python-hydra-core: for Hydra configuration support'
  'python-jsonargparse: for the LightningCLI'
  'python-matplotlib: for plotting'
  'python-omegaconf: for OmegaConf configuration support'
  'python-rich: for rich terminal output'
  'python-tensorboardx: for TensorBoard logging'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1c32cefa76a1a9c4c5250338272d961d1e48b180e68396849efe128538ddb28e')

build() {
  cd "${_pkgname}-${pkgver}"
  export PACKAGE_NAME=pytorch
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
