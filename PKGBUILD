# Maintainer: Brandon Clifford <brandon099 at gmail dot com>

_gitname=i3lock-color
pkgname="$_gitname-git"
pkgver=r232.b332ce6
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM with color configuration support"
arch=('i686' 'x86_64')
url="https://github.com/Arcaena/i3lock-color"
license=('MIT')
depends=('xcb-util-image' 'xcb-util-keysyms' 'pam' 'libev' 'libx11' 'cairo')
provides=('i3lock')
conflicts=('i3lock')
makedepends=('git' 'libxkbcommon-x11')
source=("git+https://github.com/Arcaena/$_gitname.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_gitname}"
    sed -i 's| -m 644 i3lock-color.1.gz| -Dm 644 i3lock-color.1.gz|' Makefile
}

build() {
    cd "${srcdir}/${_gitname}"
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make MANDIR="${pkgdir}/usr/share/man" DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}
