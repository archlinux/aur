# Maintainer: Wieland Hoffmann <the_mineo@web.de>
pkgname=chromaprint-git
pkgver=v1.3.1.r5.9e30d9c
pkgrel=1
pkgdesc="Client library, written in C++, for extracting audio fingerprints. "
arch=('i686' 'x86_64')
url="http://wiki.acoustid.org/wiki/Chromaprint"
license=('LGPL')
provides=('chromaprint')
conflicts=('chromaprint-bzr' 'chromaprint')
depends=('ffmpeg')
makedepends=('git' 'cmake')
source=('git+https://bitbucket.org/acoustid/chromaprint.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/chromaprint"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/chromaprint"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_EXAMPLES=ON .
}

package() {
    cd "$srcdir/chromaprint"
    make DESTDIR="$pkgdir/" install
} 
