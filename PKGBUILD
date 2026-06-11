# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=ffmpegfs
pkgver=2.18
pkgrel=2
pkgdesc="FUSE-based transcoding filesystem with video support from many formats to MP4, WebM, OGG, MP3, OPUS, MOV, ProRes or WAV."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64') # Not arch-specific, should work on all
url="https://nschlia.github.io/ffmpegfs/"
license=('GPL-3.0-or-later' 'GFDL-1.3-no-invariants-or-later')
makedepends=('asciidoc' 'w3m' 'xxd')
depends=('fuse3' 'ffmpeg' 'sqlite' 'libbluray' 'libdvdread' 'libcue' 'libchardet')
source=("https://github.com/nschlia/ffmpegfs/releases/download/v$pkgver/ffmpegfs-$pkgver.tar.gz")
sha384sums=('2edcf9b8d9629d5572f545136ffc63490c38203afa6adabe6af5d65393636ab36630636c331c934ae3cc091b0b34b57e')

build() {
    cd "$pkgname-$pkgver"
    autoreconf
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install

    install -Dm644 README.md "$pkgdir/usr/share/doc/ffmpegfs/README.md"
}
