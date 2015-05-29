# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="budgetwarrior-git"
_pkgname="budgetwarrior"
pkgver=0.4.1.1.r5.g13de1b0
pkgrel=1
pkgdesc="Simple command line utility to helps keeping track of your expenses and the state of your budget."
url="https://github.com/wichtounet/budgetwarrior"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake' 'clang')
depends=('boost' 'util-linux')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
changelog="ChangeLog"
source=("${_pkgname}::git+https://github.com/wichtounet/${_pkgname}#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}/"

    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}/"
}

build() {
    cd "${srcdir}/${_pkgname}/"

    make
}

package() {
    cd "${srcdir}/${_pkgname}/"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/man/man3"
    install -d "${pkgdir}/usr/share/zsh/site-functions/"
    install -d "${pkgdir}/etc/bash_completion.d"
    make prefix="${pkgdir}/usr" install
}

# vim:set ts=4 sw=4 et:
