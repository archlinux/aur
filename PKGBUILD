# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-matscipy
_pkgname=matscipy
pkgver=1.3.1
pkgrel=1
pkgdesc="Generic Python materials science tools for plasticity, fracture mechanics, and more"
arch=('x86_64')
url="https://github.com/libAtoms/matscipy"
license=('LGPL-2.1-only')
depends=(
    'python-numpy'
    'python-scipy'
    'python-ase'
    'python-packaging'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'meson'
    'meson-python'
    'ninja'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/e7/dd/4088a5e52e91c81a94fa7d92b03cfb75803371ccfe3283e128b33c74a992/matscipy-1.3.1.tar.gz")
sha256sums=('b66296fff34d63f36bbc5c23e307808c8060202016e779bf2d3fa762d8050258')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
