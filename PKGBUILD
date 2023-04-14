# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

gitname=Minder
author=phase1geo
auxname=minder
pkgname=("${auxname}-git")
pkgver=r1742.67fca66
pkgrel=1
pkgdesc="Mind-mapping application designed for Pantheon"
arch=('i686' 'x86_64')
url="https://github.com/${author}/${gitname}"
license=('GPL3')
depends=('gtk3' 'cairo' 'discount' 'glib2' 'granite' 'gtksourceview4' 'libarchive' 'libgee' 'libxml2')
optdepends=()
makedepends=('git' 'meson' 'ninja' 'vala')
provides=("${auxname}")
conflicts=("${auxname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${gitname}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

