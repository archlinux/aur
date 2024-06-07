# Maintainer: RRRRRm <isxiongzj@gmail.com>
pkgname=beslyric-for-x-git
pkgver=v3.2.0.r2.g8b06a38
pkgrel=4
pkgdesc="A simple but useful lyrics generator, mainly for Netease Cloud Music."
arch=('i686' 'x86_64')
url="https://github.com/BesLyric-for-X/BesLyric-for-X"
license=('GPL')
depends=('qt5-base' 'ffmpeg4.4' 'sdl2' 'openssl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/BesLyric-for-X/BesLyric-for-X.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/BesLyric-for-X"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/BesLyric-for-X"
    sed -i '/unix {/,/}/c\
unix {\
    CONFIG *= link_pkgconfig\
    PKGCONFIG += \\\
        /usr/lib/ffmpeg4.4/pkgconfig/libavcodec.pc \\\
        /usr/lib/ffmpeg4.4/pkgconfig/libavdevice.pc \\\
        /usr/lib/ffmpeg4.4/pkgconfig/libavfilter.pc \\\
        /usr/lib/ffmpeg4.4/pkgconfig/libavformat.pc \\\
        /usr/lib/ffmpeg4.4/pkgconfig/libavutil.pc \\\
        /usr/lib/ffmpeg4.4/pkgconfig/libpostproc.pc \\\
        /usr/lib/ffmpeg4.4/pkgconfig/libswresample.pc \\\
        /usr/lib/ffmpeg4.4/pkgconfig/libswscale.pc \\\
        sdl2\
}' Beslyric-for-X.pro
}

build() {
    cd "$srcdir/BesLyric-for-X"
    qmake Beslyric-for-X.pro
    make
}

package() {
    cd "$srcdir/BesLyric-for-X"
    make INSTALL_ROOT="$pkgdir" install
}

