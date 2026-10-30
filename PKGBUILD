# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-packflow
_pkgname=packflow
_commit=9fa158a85701897bbb113192df708930e2d9edf9
pkgver=1.0.0
pkgrel=1
pkgdesc="Flow matching for molecular crystal structure prediction with GRPO post-training"
arch=('any')
url="https://github.com/learningmatter-mit/PackFlow"
license=('MIT')
depends=(
    'python-numpy'
    'python-scipy'
    'python-pandas'
    'python-matplotlib'
    'python-tqdm'
    'python-yaml'
    'python-pytorch'
    'python-torch-geometric'
    'python-pymatgen-core'
    'python-ase'
    'python-scikit-learn'
    'python-networkx'
    'python-e3nn'
    'spglib'
    'python-joblib'
    'python-huggingface-hub'
)
optdepends=(
    'python-rdkit: molecular crystal support'
    'python-einops: tensor operations'
    'python-gemmi: crystallographic file handling'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/learningmatter-mit/PackFlow/archive/${_commit}.tar.gz")
sha256sums=('7be6bb8dcb3d78827cc9740990e6015b87f2cce697722f223c4f244271a97aad')

build() {
    cd "${_pkgname}-${_commit}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${_commit}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
