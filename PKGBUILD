# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

_pkgname='cbonsai'
pkgname="${_pkgname}-git"
pkgver=r40.afb6878
pkgrel=1
pkgdesc='A bonsai tree generator, written in C using ncurses'
arch=('any')
url="https://gitlab.com/jallbrit/${_pkgname}"
license=('GPL3')
depends=('gcc')
makedepends=('git')
provides=('cbonsai')
source=("${_pkgname}::git+${url}.git")
md5sums=(SKIP)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    gcc cbonsai.c -Wall -Wpedantic -l panel -l ncurses -o cbonsai
    install -vDm 755 cbonsai -t "${pkgdir}/usr/bin/"
}
