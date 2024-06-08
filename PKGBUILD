# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>
pkgname=python-flash-patcher
_name=flash-patcher
pkgver=6.2.1
pkgrel=1
pkgdesc="Adobe Flash SWF file patching tool"
arch=('any')
url="https://github.com/rayyaw/flash-patcher"
license=('AGPL3')
depends=('ffdec' 'python' 'python-antlr4')
makedepends=('python-installer' 'python-hatch' 'antlr4')
source=("https://github.com/rayyaw/flash-patcher/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('05f69e30e4160477a035bca742cc69dce62af10ae32b3ee72ff1cbd4f4abf10b90f9ba59b681a3785901dee97dde4fd8693ecbd4b866da4e0a60a222bd1eae64')

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
