# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=Translator
_author=RapidFingers
_auxname=translator
pkgname=("${_auxname}-git")
pkgver=r98.7b14a43
pkgrel=1
pkgdesc="Translater app that uses Yandex API designed for Pantheon. Donate Link: http://bit.do/Translator_Donate"
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('gtk3' 'granite' 'glib2' 'json-glib' 'libgee' 'libsoup')
optdepends=()
makedepends=('git' 'meson' 'vala')
provides=("${_auxname}")
conflicts=("${_auxname}")
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

