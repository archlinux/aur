# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=ffmpegfs
pkgver=1.10
pkgrel=1
pkgdesc="FUSE-based transcoding filesystem from many formats to MP3 or MP4 including video transcoding"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64') # Not arch-specific, should work on all
url="https://nschlia.github.io/ffmpegfs/"
license=('GPL3' 'FDL1.3')
makedepends=('asciidoc' 'w3m' 'xxd')
depends=('fuse' 'ffmpeg' 'sqlite' 'libbluray')
source=("https://github.com/nschlia/ffmpegfs/releases/download/v$pkgver/ffmpegfs-$pkgver.tar.gz"
        "move-cache-to-xdg-cache-home.patch")

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 -i ../move-cache-to-xdg-cache-home.patch
}

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

sha384sums=('7d09182ae0bed45d86567a51a52038dffe1c2b69c9b5a8bb842b5bcce1cc429b92f9ed9cd694abdcce385286ae1895fc'
            'ec9c63cf5d2d7de81a766f95aa4f1a83889b639fcc258caafbe2812091a1885b587cffc869f90d5088f532ee5a69441b')
