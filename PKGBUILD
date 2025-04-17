# Contributor : Matthew Gamble
# Contributor : Draje <draje@nullsum.net>

pkgname=mp3fs-git
pkgver=1.1.1.r10.g0bda170
pkgrel=1
pkgdesc="FUSE-based transcoding filesystem from FLAC to MP3"
arch=("x86_64")
url="https://khenriks.github.io/mp3fs"
license=("GPL-3.0-or-later")
depends=("fuse" "flac" "lame" "libid3tag" "libvorbis")
makedepends=("git" "pandoc-cli")
conflicts=("mp3fs")
source=('git+https://github.com/khenriks/mp3fs.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/mp3fs"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cd "$srcdir/mp3fs"

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/mp3fs"
    make DESTDIR="$pkgdir" install
}
