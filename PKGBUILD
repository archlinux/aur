# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

gitname=taxi
author=Alecaddd
pkgname=("${gitname}-git")
pkgver=r212.74aade6
pkgrel=1
pkgdesc="Taxi is a native Linux FTP client designed for elementary OS. If you like Taxi and you want to support its development, consider donating via https://www.paypal.me/alecaddd or https://www.patreon.com/alecaddd"
arch=('i686' 'x86_64')
url="https://github.com/${author}/${gitname}"
license=('GPL3')
depends=('gtk3' 'vala' 'granite' 'glib2' 'libsoup' 'libsecret')
optdepends=()
makedepends=('git' 'meson' 'ninja' 'vala-lint-git')
provides=("${gitname}")
conflicts=("${gitname}")
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

