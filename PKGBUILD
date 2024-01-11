# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>
pkgname=python-flash-patcher
_name=flash-patcher
pkgver=5.1.0
pkgrel=1
pkgdesc="Adobe Flash SWF file patching tool"
arch=('any')
url="https://github.com/rayyaw/flash-patcher"
license=('CC-BY-SA-4.0')
depends=('ffdec' 'python' 'python-antlr4')
makedepends=('python-installer' 'python-hatch' 'antlr4')
source=("https://github.com/rayyaw/flash-patcher/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('429bcb593094e79b22350981bbabe6ffb69ba5ed439c43b6a81f2fa1ac9af809f45d62183277682c63eb66edad59a7363b6b2e394cccffec8981a35ee48c4126')

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

