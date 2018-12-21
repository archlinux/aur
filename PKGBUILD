# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor:

_gitname=screenrecorder
_author=mohelm97
pkgname=("${_gitname}-git")
pkgver=latest
pkgrel=1
pkgdesc="A simple screen recorder app designed for Pantheon Shell"
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('gtk3' 'granite' 'clutter-gst' 'clutter-gtk' 'gstreamer' 'libx11')
optdepends=('')
makedepends=('git' 'meson' 'ninja' 'vala')
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

