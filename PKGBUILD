# Contributor: Philippe Hürlimann <p@hurlimann.org>
# Contributor: Michel Zou <xantares09@hotmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=retdec
pkgver=5.0
pkgrel=1
pkgdesc="A retargetable machine-code decompiler based on LLVM"
arch=('x86_64')
url="https://retdec.com/"
license=('MIT')
depends=('openssl' 'python' 'zlib')
makedepends=('cmake' 'doxygen' 'graphviz')
optdepends=('upx: To use UPX unpacker in the preprocessing stage'
            'graphviz: To generate call or control flow grpahs')
source=("https://github.com/avast/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('216dc62fd54ff06277497492dbf44bc7a91e39249d8aefdee2e4f10fc903ce85')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DRETDEC_DOC=ON \
        ..
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make install
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE*
}

# vim: set sw=4 ts=4 et:
