# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=ffmpegfs
pkgver=1.9
pkgrel=1
pkgdesc="FUSE-based transcoding filesystem from many formats to MP3 or MP4 including video transcoding"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64') # Not arch-specific, should work on all
url="https://nschlia.github.io/ffmpegfs/"
license=('GPL3' 'FDL1.3')
makedepends=('asciidoc' 'w3m' 'xxd')
depends=('fuse' 'ffmpeg' 'sqlite' 'libbluray')
source=("https://github.com/nschlia/ffmpegfs/releases/download/v$pkgver/ffmpegfs-$pkgver.tar.gz"
        "revert-move-to-var-cache.patch")
sha384sums=('188fb452d59359f94c689eb65de5b226c1affebeffeef37692595f187dcc306209f0b1658635741a6a372d19f9cd05ae'
            '359b739b93d314d9d5a132a359c04c121c15225f5383cbe9570b4f7b44aaa6685fa24fb281281258e0937fff7b9ee776')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 -i ../revert-move-to-var-cache.patch
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
