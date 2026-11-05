pkgname=rlshim-bin
pkgver=1.5.1
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
sha256sums_x86_64=('eb498e06cd74864b0a994b10223f86f19be4408a53e98b49a7552d35d2ee37e9')
sha256sums_aarch64=('dcb789ea9fd1b15178ba795609ebf6ecf4ed9672852f568e135f7d8ea0850e8c')

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
