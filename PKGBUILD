# Maintainer: Marten Hoffmann <maa@mailbox.org>
# Contributor: Lam Duong <lamduong2@acm.org>

pkgname=python-fastai2
_pkgname=fastai
pkgver=2.8.8
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
sha512sums=('58cba5eb96fd0a06cf04e9e69b532abe547b9f9c522ca5b31b0ba15cb1997c2ba8ed7731dbb9879082e87ef25e96b20d7d166a7ebe941cd67e76e5718bc01389')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
