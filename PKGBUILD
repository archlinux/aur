# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=musikcube-git
pkgver=3.0.4.r0.g009e9620b
pkgrel=1
pkgdesc="a terminal-based cross-platform music player, audio engine, metadata indexer, and server"
arch=('x86_64')
url="https://github.com/clangen/musikcube"
license=('BSD')
depends=('libogg' 'libvorbis' 'libmicrohttpd' 'ffmpeg' 'lame' 'ncurses' 'pulse-native-provider'
         'libpulse' 'alsa-lib' 'curl' 'libev' 'taglib' 'libopenmpt' 'asio')
makedepends=('cmake' 'git')
provides=('musikcube')
conflicts=('musikcube')
source=('musikcube::git+https://github.com/clangen/musikcube.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake -B build -S "${PWD}" -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make -C build DESTDIR="$pkgdir/" install

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
