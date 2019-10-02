# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=spectator
_author=treagod
pkgname=("${_gitname}-rest-client-git")
pkgver=r335.a61fa66
pkgrel=1
pkgdesc="Spectator is a native application written in Vala using GTK. It's enables you to test the API endpoints of your HTTP server."
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('duktape' 'granite' 'gtk3' 'gtksourceview3' 'json-glib' 'libgee' 'webkit2gtk')
optdepends=('lib32-json-glib')
makedepends=('git' 'meson' 'vala')
provides=("${_gitname}-rest-client")
conflicts=("${_gitname}-rest-client")
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

