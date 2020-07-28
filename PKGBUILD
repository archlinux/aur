# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=tuner
_author=louis77
pkgname=("${_gitname}-git")
pkgver=r92.cd9008be
pkgrel=1
pkgdesc="An app to discover and listen to internet radio stations"
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('gtk3' 'granite' 'gstreamer' 'gst-plugins-bad-libs' 'libgee' 'libsoup' 'json-glib')
optdepends=()
makedepends=('git' 'meson' 'vala')
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

