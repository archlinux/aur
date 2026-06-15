# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=ffmpegfs
pkgver=2.50
pkgrel=1
pkgdesc="FUSE-based transcoding filesystem with video support from many formats to MP4, WebM, OGG, MP3, OPUS, MOV, ProRes or WAV."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64') # Not arch-specific, should work on all
url="https://nschlia.github.io/ffmpegfs/"
license=('GPL-3.0-or-later' 'GFDL-1.3-no-invariants-or-later')
makedepends=('asciidoc' 'w3m' 'xxd')
depends=('fuse3' 'ffmpeg' 'sqlite' 'libbluray' 'libdvdread' 'libcue' 'libchardet')
source=("https://github.com/nschlia/ffmpegfs/archive/refs/tags/v$pkgver.tar.gz")
sha384sums=('5fcfd52bf15baa138bcc358716a8d079af8cac79d29f4f5f294f2eeb0b0926ae66d59395019d63056b434dd7fa417178')

build() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install

    install -Dm644 README.md "$pkgdir/usr/share/doc/ffmpegfs/README.md"
}
