# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

gitname=quilter
pkgname=("${gitname}-git")
pkgver=r506.0ba9fde
pkgrel=1
pkgdesc="Markdown reader with preview option designed for elementary OS. Donations: Would you like to support the development of this app to new heights? Then: https://www.patreon.com/lainsce"
arch=('i686' 'x86_64')
url="https://github.com/lainsce/${gitname}"
license=('GPL3')
depends=('gtk3' 'granite' 'gtkspell3' 'gtksourceview3' 'webkit2gtk' 'discount')
optdepends=()
makedepends=('git' 'vala' 'meson')
provides=("$gitname")
conflicts=("$gitname")
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

