# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=ffmpegfs
pkgver=2.17
pkgrel=1
pkgdesc="FUSE-based transcoding filesystem with video support from many formats to MP4, WebM, OGG, MP3, OPUS, MOV, ProRes or WAV."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64') # Not arch-specific, should work on all
url="https://nschlia.github.io/ffmpegfs/"
license=('GPL-3.0-or-later' 'GFDL-1.3-no-invariants-or-later')
makedepends=('asciidoc' 'w3m' 'xxd')
depends=('fuse3' 'ffmpeg' 'sqlite' 'libbluray' 'libdvdread' 'libcue' 'libchardet')
source=("https://github.com/nschlia/ffmpegfs/releases/download/v$pkgver/ffmpegfs-$pkgver.tar.gz")
sha384sums=('44599f35aaa86d407af72da5b43a70503ee8ab926a5155350e16fd50aa21d5c90f3e66d5532cdf5d42199555a9e5320a')

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
