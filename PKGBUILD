# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname=slstatus-git
pkgver=r520.1452a44
pkgrel=1
pkgdesc='A status monitor for window managers'
arch=('i686' 'x86_64')
url='http://tools.suckless.org/slstatus'
depends=('libx11')
makedepends=('git')
license=('custom:ISC')
source=("git+https://git.suckless.org/${pkgname%-git}"
        "config.h")
md5sums=('SKIP'
         '6029dd3fc8c6f3d2a00def73d6d2e035')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cp config.h "${pkgname%-git}/config.h"
}

build() {
    cd "${pkgname%-git}"
    make X11INC='/usr/include/X11' X11LIB='/usr/lib/X11'
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="${pkgdir}" PREFIX='/usr/' install

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
