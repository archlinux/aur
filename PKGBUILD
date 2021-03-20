# Maintainer: Wieland Hoffmann <the_mineo@web.de>
pkgname=chromaprint-git
pkgver=v1.5.0.r0.516e3b3
pkgrel=1
pkgdesc="Client library, written in C++, for extracting audio fingerprints. "
arch=('i686' 'x86_64')
url="https://acoustid.org/chromaprint"
license=('LGPL')
provides=('chromaprint')
conflicts=('chromaprint-bzr' 'chromaprint')
depends=('ffmpeg')
makedepends=('git' 'cmake')
source=('git+https://github.com/acoustid/chromaprint.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/chromaprint"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/chromaprint"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TOOLS=ON .
}

package() {
    cd "$srcdir/chromaprint"
    make DESTDIR="$pkgdir/" install
} 
