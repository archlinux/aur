# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-torchtext
_pkgname=text
pkgver=0.15.2
pkgrel=1
epoch=1
pkgdesc='Data loaders and abstractions for text and NLP'
arch=('x86_64')
url='https://github.com/pytorch/text'
license=('BSD')
depends=(
  python-numpy
  python-pytorch
  python-requests
  python-tqdm
)
optdepends=(
  python-nltk
  python-revtok
  "python-sacremoses: Moses tokenizer port in SacreMoses"
  "python-spacy: English tokenizer from SpaCy"
)
makedepends=(
  cmake
  git
  ninja
  numactl
  python-build
  python-installer
  python-setuptools
  python-sympy
  python-wheel
)
source=("${_pkgname}::git+https://github.com/pytorch/text.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
  cd "${_pkgname}"
  git submodule update --init --recursive
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
