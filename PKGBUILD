# Maintainer: Seraphim Pardee <me at srp dot life>

pkgname=rlshim-bin
pkgver=1.3.0
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
sha256sums_x86_64=('caa2980baa3e8d28b95226187c935267d82d6dafe54e2e4f5b3db45336706b97')
sha256sums_aarch64=('b7eec414bcf5d71bd67a6b3ddcdc1a6dc8134eeb23f4e4bb69110c2836ccb70e')

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
