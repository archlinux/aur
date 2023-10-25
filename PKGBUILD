# Maintainer: Your Name <johnjahi55@gmail.com>
_pkgname=nchat
pkgname=${_pkgname}-git
pkgver=3.67.r29.g7cbe848
pkgrel=1
pkgdesc="nchat is a console-based chat client for Linux and macOS with support for Telegram."
arch=('any')
url="https://github.com/d99kris/nchat"
license=('MIT')
depends=('ncurses' 'ccache' 'cmake' 'gperf' 'help2man' 'readline' 'openssl' 'zlib'  'sqlite' 'go' 'file')

makedepends=('git')
provides=('nchat-git')
conflicts=('nchat-git' 'nchat')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    sed -i 's|ncursesw/ncurses.h|ncurses.h|' src/ui*
}

build() {
    cd "${srcdir}/${_pkgname}"
    # Perform a debug build
    bash ./make.sh debug

}
package() {
    cd "${srcdir}/${_pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    cd dbgbuild
    make DESTDIR="${pkgdir}" install
}
