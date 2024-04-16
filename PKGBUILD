# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>
pkgname=python-flash-patcher
_name=flash-patcher
pkgver=6.2.0
pkgrel=1
pkgdesc="Adobe Flash SWF file patching tool"
arch=('any')
url="https://github.com/rayyaw/flash-patcher"
license=('AGPL3')
depends=('ffdec' 'python' 'python-antlr4')
makedepends=('python-installer' 'python-hatch' 'antlr4')
source=("https://github.com/rayyaw/flash-patcher/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('146e5277ca57e25522d49872777f6943f4fde939dccb4af4a0faaec0ab92a420a9ddd7bd3936471439cc43dd1368ea85b620b4b6fd9e62b353d9a02bc9d18fa3')

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

b2sums=('3af5df8a9fdf18524f9a0992a2323c39e9eb43361a49cbffd889dd2cb6d84934cce3965afb67d000df0005d533d487fe20500751d323bc1b664013af1b770a20')
