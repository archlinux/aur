# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>
pkgname=python-flash-patcher
_name=flash-patcher
pkgver=6.0.0
pkgrel=1
pkgdesc="Adobe Flash SWF file patching tool"
arch=('any')
url="https://github.com/rayyaw/flash-patcher"
license=('AGPL3')
depends=('ffdec' 'python' 'python-antlr4')
makedepends=('python-installer' 'python-hatch' 'antlr4')
source=("https://github.com/rayyaw/flash-patcher/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ed8e2578b7a61496781d09485bedeb506b61f90b939bff82789fa642f936722d83a6836999711339aa0e5e2bb4b2e37538d8c5de65c183bc776623b06a698d4b')

prepare() {
    rm "${_name}-${pkgver}/flash_patcher/antlr_source/.gitkeep"
}

build() {
    cd "${_name}-${pkgver}/build"
    make
}

package() {
    cd "${_name}-${pkgver}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd build
    python -m installer --destdir="$pkgdir" dist/*.whl
}

