# Maintainer: Hans-Nikolai Viessmann <hv15 @ hw.ac.uk>
pkgname=musikcube-git
pkgver=0.70.0.r6.g9ce988f8
pkgrel=1
pkgdesc="a terminal-based cross-platform music player, audio engine, metadata indexer, and server"
arch=('x86_64')
url="https://github.com/clangen/musikcube"
license=('BSD')
depends=('faad2' 'libogg' 'libvorbis' 'flac' 'libmicrohttpd' 'lame'
         'ncurses' 'boost' 'pulseaudio' 'libpulse' 'alsa-lib' 'curl')
makedepends=('cmake' 'git')
conflicts=('musikcube')
source=('musikcube::git+https://github.com/clangen/musikcube.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
