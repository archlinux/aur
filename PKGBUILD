# Maintainer: Dylan Barker <dthomasbarker@gmail.com>
_pkgname=st
pkgname=$_pkgname-dylan-git
pkgver=0.8.4.r1134.25b5da9
pkgrel=1
pkgdesc="Dylan's build of simple virtual terminal emulator for X"
url="https://github.com/dylantjb/$_pkgname"
arch=('i686' 'x86_64')
license=('MIT')
options=('zipman')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
optdepends=('dmenu' 'xclip')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(awk '/^VERSION =/ {print $3}' config.mk)".r"$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd $_pkgname
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
