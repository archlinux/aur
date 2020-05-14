# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: Paulo Queiroz <pvaqueiroz@gmail.com>

_gitname=marble
_author=raggesilver
_pkg=("${_gitname}-gtk")
pkgname=("${_pkg}-git")
pkgver=r24.ad2d5bf
pkgrel=1
pkgdesc="A collection of useful functions and reusable widget for GTK"
arch=('i686' 'x86_64')
url="https://gitlab.com/${_author}/${_gitname}"
license=('GPL3')
depends=('gtk3')
optdepends=('')
makedepends=('git' 'meson>=0.50.0' 'vala')
provides=("${_pkg}" "${pkgname}")
conflicts=("${_pkg}")
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

