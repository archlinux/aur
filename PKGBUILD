# Maintainer: Seraphim Pardee <me at srp dot life>

pkgname=rlshim-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A lightweight, native Linux launcher for RuneLite. (binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/RdrSeraphim/rlshim"
license=('BSD-2-Clause')
depends=('libsecret' 'openssl' 'glfw' 'glibc' 'java-runtime>=11')
provides=('rlshim')
conflicts=('rlshim')
source_x86_64=("https://github.com/RdrSeraphim/rlshim/releases/download/v$pkgver/rlshim-$pkgver-x86_64-gnu.tar.gz")
source_aarch64=("https://github.com/RdrSeraphim/rlshim/releases/download/v$pkgver/rlshim-$pkgver-aarch64-gnu.tar.gz")
sha256sums_x86_64=('02af6f79ef9b03891a638b25ebf78d77034f0361e92a979a0acaa49749f66e9d')
sha256sums_aarch64=('57e69c37b5fc9fe386d6907a8ba4548fb83c5f63c2fb2b28ceeea737d7f98b33')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        cd "rlshim-$pkgver-x86_64-gnu"
    elif [[ "$CARCH" == "aarch64" ]]; then
        cd "rlshim-$pkgver-aarch64-gnu"
    fi
    
    install -Dm755 bin/rlshim "$pkgdir/usr/bin/rlshim"
    install -Dm644 share/applications/rlshim.desktop "$pkgdir/usr/share/applications/rlshim.desktop"
    install -Dm644 share/pixmaps/rlshim.png "$pkgdir/usr/share/pixmaps/rlshim.png"
    
    mkdir -p "$pkgdir/usr/share/rlshim"
    cp -r share/rlshim/* "$pkgdir/usr/share/rlshim/"
}
