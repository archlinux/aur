# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: redponike <proton (dot) me>
# Contributor: Alex Hirzel <alex at hirzel period us>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-torchmetrics
_pkgname=${pkgname#python-}
pkgver=1.9.0
pkgrel=2
pkgdesc='Machine learning metrics for distributed, scalable PyTorch applications'
arch=('any')
url='https://github.com/Lightning-AI/torchmetrics'
license=('Apache-2.0')
depends=(
  'python'
  'python-lightning-utilities>=0.15.3'
  'python-numpy'
  'python-packaging'
  'python-pytorch'
)
optdepends=(
  'python-einops: Multimodal subdomain dependency'
  'python-timm: Multimodal subdomain dependency'
  'python-nltk: Text subdomain dependency'
  'python-regex: Text subdomain dependency'
  'python-sentencepiece: Text subdomain dependency'
  'python-transformers: Text and multimodel subdomains dependency'
  'python-tqdm: Text subdomain dependency'
  'python-onnxruntime: Audio subdomain dependency'
  'python-requests: Audio subdomain dependency'
  'python-torchaudio: Audio subdomain dependency'
  'python-scipy: Image subdomain dependency'
  'python-torch-fidelity: Image subdomain dependency'
  'python-torchvision: Image and detection subdomains dependency'
  'python-pycocotools: Detection subdomain dependency'
  'python-matplotlib: Visual subdomain dependency'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('34408d6bd60dc9c4816b8b795cbb228cd23334a951adc8be766bd44397aedb7151af3aa582ff1c75bb2538be3652b3bf5316547c2ee3ab698db6e80892840247')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --no-isolation --wheel
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
