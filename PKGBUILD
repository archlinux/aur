# Maintainer: Marko Givens <marcxjo@cerebralbleach.com>

_pkgname=stulto
pkgname=${_pkgname}-git
pkgver=r128.4966d9e
pkgrel=1
pkgdesc='A Simple GTK+3/VTE Terminal Emulator'
arch=('x86_64')
url='https://github.com/marcxjo/stulto'
license=('LGPL')
depends=('vte3')
makedepends=('git' 'meson')
provides=('stulto')
conflicts=('stulto')
source=(
    "${_pkgname}::git+${url}.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    arch-meson build
}

package() {
    cd "${srcdir}/${_pkgname}"

    meson install -C build --destdir "${pkgdir}"
}

