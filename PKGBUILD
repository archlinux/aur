# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-comparxiv
_name=${pkgname#python-}
pkgver=0.1.8
pkgrel=1
pkgdesc="A wrapper of latexdiff to compare two version of an arXiv preprint with a single command"
arch=('any')
url="https://github.com/temken/comparxiv"
license=('MIT')
depends=(
    'python-arxiv'
    'python-argparse'
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
source=("${_name}-${pkgver}.tar.gz::https://github.com/temken/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('df820799c1d03d141af27e3fb6b8f4caa6c8ce190056496ff99bc4b6857d8d9a1f6d268ed14352bbc2293d22fd1d1ea1295eac2ec89b44a9fdb70b6c12be6330')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
