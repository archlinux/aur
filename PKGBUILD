# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-chgnet
_pkgname=chgnet
pkgver=0.4.2
pkgrel=1
pkgdesc="Pretrained Universal Neural Network Potential for Charge-informed Atomistic Modeling"
arch=('x86_64')
url="https://github.com/CederGroupHub/chgnet"
license=('BSD-3-Clause')
depends=(
    'python>=3.10'
    'python-pytorch'
    'python-numpy'
    'python-pymatgen-core'
    'python-ase'
    'python-nvidia-ml-py'
    'cython'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'cython'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/CederGroupHub/chgnet/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('753f32c1e30044be85e9c7a126d30f231520c5fdc7a558bf48c369392c247681')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
