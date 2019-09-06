# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

gitname=lookbook
pkgname=("${gitname}-git")
pkgver=r112.56f35ba
pkgrel=1
pkgdesc="Browse and find system icons designed for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/danrabbit/${gitname}"
license=('GPL3')
depends=('gtk3' 'granite' 'gtksourceview3')
optdepends=()
makedepends=('git' 'meson' 'vala')
provides=("${gitname}")
conflicts=("${gitname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${gitname}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

