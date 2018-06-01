# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=ffmpegfs
pkgver=1.4
pkgrel=1
pkgdesc="FUSE-based transcoding filesystem from many formats to MP3 or MP4 including video transcoding"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64') # Not arch-specific, should work on all
url="https://nschlia.github.io/ffmpegfs/"
license=('GPL3' 'FDL1.3')
depends=('fuse' 'ffmpeg' 'sqlite3')
optdepends=(
    'libdvdnav: Detect IFO files and list separate DVD chapters or programs as separate files. Also needs libdvdread.'
    'libdvdread: Detect IFO files and list separate DVD chapters or programs as separate files. Also needs libdvdnav.'
    'libvcd: Detect Video CDs in directories and list chapters as separate files.'
    'libbluray: To detect bluray files in directories and list separate chapters and titles as separate files.'
)
#source=("https://github.com/nschlia/ffmpegfs/releases/download/v$pkgver/ffmpegfs-$pkgver.tar.gz")
source=("https://github.com/nschlia/ffmpegfs/files/2053934/ffmpegfs-1.4.tar.gz")
sha384sums=('a9256e636743323b1595f1f9b3201798d3118fa6ab06c26b8ddcd13cf09016ca7af2351bb7cbc825f8bd10539b3aacbe')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install

    install -Dm644 README.md "$pkgdir/usr/share/doc/ffmpegfs/README.md"
}
