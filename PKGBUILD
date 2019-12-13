# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=webwatcher
_author=kjlaw89
pkgname=("${_gitname}-git")
pkgver=r24.3d3099f
pkgrel=2
pkgdesc="Know when your websites are misbehaving! An app designed for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('gtk3' 'granite'
         'glib2' 'json-glib' 'libsoup' 'libappindicator-gtk3' 'libunity' 'sqlite')
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
