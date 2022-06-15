# Maintainer: Noah Jelen <noahtjelen@gmail.com>

pkgname=music-lounge
pkgver=0.2.0
pkgrel=1
pkgdesc="Yet another music player"
arch=('i686' 'x86_64')
url="https://gitlab.com/aercloud-systems/music-lounge"
license=('GPL')
depends=('ncurses' 'gcc-libs' 'glibc' 'glib2' 'gst-plugins-bad-libs' 'gst-plugins-base-libs' 'gstreamer' 'libffi' 'orc' 'libunwind' 'libelf' 'pcre' 'xz' 'zlib' 'zstd' 'bzip2')
makedepends=('cargo' 'gzip')
source=("https://gitlab.com/aercloud-systems/music-lounge/-/archive/$pkgver/music-lounge-$pkgver.zip")
md5sums=('SKIP')

build() {
    cd "music-lounge-$pkgver"
    cargo build --release
}

package() {
    #the package contents
    cd "music-lounge-$pkgver"
    mkdir -p "$pkgdir/usr/lib/mlounge"
    install -Dt "$pkgdir/usr/bin" -m755 target/release/mlounge
    install -Dt "$pkgdir/usr/share/applications/" mlounge.desktop
    install -Dt "$pkgdir/usr/lib/mlounge/" icon.png
}
