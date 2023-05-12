# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-comparxiv
_name=${pkgname#python-}
pkgver=0.1.9
pkgrel=3
pkgdesc="A wrapper of latexdiff to compare two version of an arXiv preprint with a single command"
arch=('any')
url="https://github.com/temken/comparxiv"
license=('MIT')
depends=(
    'python-arxiv'
    'python-requests'
    'python-tqdm'
    'texlive-bin'
    'texlive-core'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('d9c7583ee8e9bf9943195f31d76a799232ebf99f197ea8a907a2c98c90228777855fe050c7d56e3bced1c71c5508b4b01bc7998287f2caa1ef6933a0cb1c61e2')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
