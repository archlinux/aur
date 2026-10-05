# Maintainer: Marten Hoffmann <maa@mailbox.org>
# Contributor: Lam Duong <lamduong2@acm.org>

pkgname=python-fastai2
_pkgname=fastai
pkgver=2.8.12
pkgrel=1
pkgdesc='Deep learning library build on PyTorch with CPU. Version 2 of fastai.'
arch=('any')
url='https://github.com/fastai/fastai'
license=('Apache-2.0')
depends=(
  python-fastcore
  python-fastdownload
  python-fastprogress
  python-matplotlib
  python-packaging
  python-pandas
  python-pillow
  python-pytorch
  python-pyaml
  python-requests
  python-scikit-learn
  python-scipy
  python-torchvision
)
makedepends=(
  python-setuptools
)

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/fastai/fastai/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('f3848612e93e0b054d456b38c60c7cb507552ffa6d80a35962fa524b1fa55b4ec8fe698af30577466967a1d5a877d40cf00fe8c3020a8c7139af6be9d01c97f5')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
