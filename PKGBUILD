# Maintainer: Seraphim Pardee <me at srp dot life>
pkgname=rlshim-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A lightweight, native Linux launcher for RuneLite. (binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/RdrSeraphim/rlshim"
license=('BSD-2-Clause')
depends=('libsecret' 'gcc-libs' 'glibc' 'java-runtime>=11')
provides=('rlshim')
conflicts=('rlshim')
source_x86_64=("https://github.com/RdrSeraphim/rlshim/releases/download/v$pkgver/rlshim-$pkgver-x86_64-gnu.tar.gz")
source_aarch64=("https://github.com/RdrSeraphim/rlshim/releases/download/v$pkgver/rlshim-$pkgver-aarch64-gnu.tar.gz")
sha256sums_x86_64=('28d492718eda962afac7631658db5fc67d32f45017b6f814a7fb7367110c76c4')
sha256sums_aarch64=('a90a31d2b4b8f9f2e45d580aad8befd45aa75a0dad88ba76db535b08d6629f12')

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
