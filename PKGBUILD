# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

_gitname=ValaCompiler
auxname=valacompiler
author=basjam
pkgname=("${auxname}-git")
pkgver=r111.17b50ce
pkgrel=1
pkgdesc="A simple GUI for the command line valac designed for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/${author}/${_gitname}"
license=('GPL3')
depends=('gtk3' 'vala' 'granite')
optdepends=()
makedepends=('git' 'meson' 'ninja')
provides=("${auxname}")
conflicts=("${auxname}")
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

