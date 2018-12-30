# Maintainer: LinArcx <linarcx@gmail.com>

pkgname="mouse-git"
pkgver=r8.2355019
pkgrel=1
pkgdesc="Ncurses-based power manager"
arch=('any')
url="https://github.com/LinArcX/Mouse"
license=('GPL-3.0')
depends=('ncurses')
makedepends=('git' 'gcc')

source=("${pkgname}::git+https://github.com/LinArcX/Mouse")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname}"
    g++ -lncurses  mouse.cpp -o mouse
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm644 mouse ${pkgdir}/usr/bin/mouse # what is install? see: man install
    chmod +x ${pkgdir}/usr/bin/mouse
}
