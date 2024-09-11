# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>
pkgname=python-flash-patcher
_name=flash-patcher
pkgver=6.2.2
pkgrel=1
pkgdesc="Adobe Flash SWF file patching tool"
arch=('any')
url="https://github.com/rayyaw/flash-patcher"
license=('AGPL-3.0-or-later')
depends=('ffdec' 'python' 'python-antlr4')
makedepends=('python-installer' 'python-hatch' 'antlr4')
source=("https://github.com/rayyaw/flash-patcher/archive/refs/tags/v.${pkgver}.tar.gz")
b2sums=('b6ddfc972af3923ea51921653675f402aa7b5bb4f23a433c1428cfe168967c21b2376116cfdca82855691f0ea0b7bda482f5ff5f6212346a045d476d4018d9e4')

prepare() {
    rm "${_name}-v.${pkgver}/flash_patcher/antlr_source/.gitkeep"
}

build() {
    cd "${_name}-v.${pkgver}/build"
    make
}

package() {
    cd "${_name}-v.${pkgver}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd build
    python -m installer --destdir="$pkgdir" dist/*.whl
}
