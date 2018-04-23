# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=ffmpegfs
pkgver=1.2
pkgrel=1
pkgdesc="FUSE-based transcoding filesystem from many formats to MP3 or MP4 including video transcoding"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64') # Not arch-specific, should work on all
url="https://nschlia.github.io/ffmpegfs/"
license=('GPL3' 'FDL1.3')
depends=('fuse' 'ffmpeg' 'sqlite3')
source=("https://github.com/nschlia/ffmpegfs/releases/download/v$pkgver/ffmpegfs-$pkgver.tar.gz")
sha384sums=('ba83bbc5359a1bdddbe3394b0382e4d0a7c9368bc6920906db4cfa41cb689f6bb985b37f264e5ed12535070a0d27e034')

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
