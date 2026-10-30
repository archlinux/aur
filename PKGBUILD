# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-gvp
_pkgname=gvp-pytorch
pkgver=0.1.0
pkgrel=1
pkgdesc="Geometric Vector Perceptrons: rotation-equivariant GNN for learning from biomolecular structure"
arch=('any')
url="https://github.com/drorlab/gvp-pytorch"
license=('MIT')
depends=(
    'python-pytorch'
    'python-torch-geometric'
    'python-tqdm'
)
optdepends=(
    'python-biopython: protein structure data loading'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/drorlab/gvp-pytorch/archive/refs/heads/main.tar.gz")
sha256sums=('e0a9763397ff7bfb822e814f5841d5c6be38fc6cb7594a7bd6b9d53a87532141')

build() {
    cd "${_pkgname}-main"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-main"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
