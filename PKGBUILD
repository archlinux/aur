# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-nequip-allegro
_pkgname=allegro
pkgver=0.8.3
pkgrel=1
pkgdesc="Allegro: scalable E(3)-equivariant interatomic potentials"
arch=('any')
url="https://github.com/mir-group/allegro"
license=('MIT')
depends=(
    'python>=3.9'
    'python-nequip'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/mir-group/allegro/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e0404db5a94a8e3fabb0c65d3e8cef31ea2b24671303d3d03ad44193c177df4a')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
