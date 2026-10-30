# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-nequip
_pkgname=nequip
pkgver=0.19.1
pkgrel=1
pkgdesc="E(3)-equivariant interatomic potentials"
arch=('any')
url="https://github.com/mir-group/nequip"
license=('MIT')
depends=(
    'python>=3.9'
    'python-pytorch'
    'python-numpy'
    'python-matscipy'
    'python-ase'
    'python-lmdb'
    'python-tqdm'
    'python-e3nn'
    'python-yaml'
    'python-hydra-core'
    'python-torchmetrics'
    'python-requests'
)
optdepends=(
    'python-lightning: training framework (install via pip: pip install lightning)'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/mir-group/nequip/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b2d676b3ac3e2cfd3270f948adf11efe1dd7ab8d21617ff5b30ac90d8f3254fd')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
