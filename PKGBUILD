# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=invader-git
pkgver=0.30.1.r2148.63f9c391
pkgrel=1
pkgdesc="Open source modding toolkit for Halo Combat Evolved on the PC"
depends=('libtiff' 'libarchive' 'flac' 'freetype2' 'libsamplerate' 'libvorbis' 'qt5-base' 'qt5-multimedia' 'zlib' 'zstd')
makedepends=('cmake' 'git' 'ninja' 'python')
arch=('x86_64')
url="https://invader.opencarnage.net"
license=('GPL3')
source=('git+https://github.com/Kavawuvi/invader.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/invader
    printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir"
    mkdir -p build
}

build() {
    cd "$srcdir"/build
    cmake ../invader -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    ninja
}

package() {
    cd "$srcdir"/build
    ninja install
}
