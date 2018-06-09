# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=ffmpegfs
pkgver=1.5
pkgrel=2
pkgdesc="FUSE-based transcoding filesystem from many formats to MP3 or MP4 including video transcoding"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64') # Not arch-specific, should work on all
url="https://nschlia.github.io/ffmpegfs/"
license=('GPL3' 'FDL1.3')
depends=('fuse' 'ffmpeg' 'sqlite3' 'libdvdnav' 'libbluray')
_fileid=2085890
source=("https://github.com/nschlia/ffmpegfs/files/$_fileid/ffmpegfs-$pkgver.tar.gz")
sha384sums=('e06dfe6e841b153e50ab10ceecf23dba1c21738ebbfba6585dd73e3b42f6f8d06171874aa811e63671eb1c533e0327ab')

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
