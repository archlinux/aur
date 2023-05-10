# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=whaler
_author=sdv43
pkgname=("${_gitname}-git")
pkgver=r59.133ac20
pkgrel=2
pkgdesc="Docker container management designed for Pantheon"
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('glib2' 'gtk3' 'libgee' 'gdk-pixbuf2' 'granite')
optdepends=()
makedepends=('git' 'meson' 'ninja' 'vala')
provides=("${_gitname}" "${_gitname}-git")
conflicts=("${_gitname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${_gitname}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

