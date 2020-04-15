# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=pebbles
_author=SubhadeepJasu
pkgname=("${_gitname}-git")
pkgver=r264.fe8a046
pkgrel=2
pkgdesc="Pebbles is an advanced calculator application designed for Pantheon Shell"
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('gtk3' 'granite' 'gsl>=2.4' 'glib2' 'libsoup' 'json-glib')
optdepends=()
makedepends=('git' 'meson' 'vala')
provides=("${_gitname}")
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

