# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
# Contributor: Joan Bruguera Micó <joanbrugueram@gmail.com>
_pkgname=ffmpegfs
pkgname=ffmpegfs-git
pkgver=1.98.r95.da13eb1
pkgrel=1
pkgdesc="FUSE-based transcoding filesystem with video support from many formats to MP4, WebM, OGG, MP3, OPUS, MOV, ProRes or WAV."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64') # Not arch-specific, should work on all
url="https://nschlia.github.io/ffmpegfs/"
license=('GPL3' 'FDL1.3')
depends=('fuse' 'ffmpeg' 'sqlite3' 'libdvdnav' 'libbluray')
makedepends=('git' 'asciidoc' 'w3m' 'xxd')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/nschlia/ffmpegfs.git")
sha384sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
    cd "${srcdir}/${_pkgname}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir/" install

    install -Dm644 README.md "$pkgdir/usr/share/doc/ffmpegfs/README.md"
}
