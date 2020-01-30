# Maintainer: Dries007 <admin@dries007.net>
pkgname=libphash-git
_pkgname=pHash
pkgver=r540.887d07b
pkgrel=1
pkgdesc="Perceptual hashing library, with audio & video support."
arch=(i686 x86_64)
url="http://phash.org/"
license=('GPL3')
depends=('mpg123' 'cimg' 'ffmpeg')
source=("$_pkgname::git+https://github.com/aetilius/pHash#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"
    cmake "$srcdir/$_pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_VIDEO_HASH=1 \
        -DWITH_AUDIO_HASH=1
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}
