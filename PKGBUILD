# Maintainer: Tomoghno <tomoghno@outlook.com>
_gitname=sideload
_author=Tomoghno
pkgname=("${_gitname}-git")
pkgver=1
pkgrel=1
pkgdesc="Install apps downloaded from the Internet"
arch=('x86_64')
license=('GPL3')
url="https://github.com/${_author}/${_gitname}"
depends=('flatpak' 'granite' 'flatpak')
makedepends=('git' 'meson' 'gtk3' 'vala' 'git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=('git+https://github.com/Tomoghno/sideload.git')
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

