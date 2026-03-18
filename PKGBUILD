# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname=rmw
pkgname=${_pkgname}-git
pkgver=0.9.4.r17.ga02b21e
pkgrel=1
pkgdesc="trash/recycle bin utility for the command line"
arch=('i686' 'x86_64' 'aarch64')
url="https://theimpossibleastronaut.com/rmw-website/"
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
makedepends=('git' 'meson' 'ninja')
optdepends=('gettext' 'canfigger')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/theimpossibleastronaut/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd                  "${srcdir}/${_pkgname}"
    git                 describe --long --abbrev=7 --tags | \
    sed                 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd                  "${srcdir}/${_pkgname}"
    arch-meson          build -Db_sanitize=none
}

build() {
    cd                  "${srcdir}/${_pkgname}"
    meson               compile -v -C build
}

package() {
    cd                  "${srcdir}/${_pkgname}"
    meson               install -C build --destdir="${pkgdir}"
}
