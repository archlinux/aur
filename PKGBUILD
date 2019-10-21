# Maintainer: Stephanie Hobbs (RX14) <steph@rx14.co.uk>

pkgname=qtraw-git
pkgver=1.1.r32
pkgrel=1
pkgdesc="Qt image plugin for loading raw files, via libraw"
arch=('x86_64')
url="https://gitlab.com/mardy/qtraw"
license=('GPL3')
depends=("qt5-base" "libraw")
makedepends=('git')
source=("qtraw::git+https://gitlab.com/mardy/qtraw")
sha256sums=('SKIP')

pkgver() {
    cd qtraw

    local project_version="$(sed -n 's/PROJECT_VERSION = \(.*\)$/\1/ p' common-config.pri)"
    printf "%s.r%s" "$project_version" "$(git rev-list --count HEAD)"
}

build() {
    cd qtraw

    qmake PREFIX="/usr"
    make
}

package() {
    cd qtraw

    make install INSTALL_ROOT="$pkgdir"
    rm -Rf "$pkgdir/usr/share/kde4"
}
