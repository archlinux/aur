# Maintainer: Fabian Posch <aur@posch.tech>

_pkgname=actsim
pkgname=act-${_pkgname}-git
_basever=0
_patchlvl=2
_gitversion=r651.f7e3c63
pkgver=${_basever}.${_patchlvl}.${_gitversion}
pkgrel=1
pkgdesc="A mixed-signal simulator capable of simulating ACT files."
arch=('x86_64')
url="https://github.com/asyncvlsi/actsim"
license=('GPL-2.0')
depends=('act-core' 'act-stdlib' 'act-tracelib' 'act-annotate')
makedepends=('git' 'make' 'gcc')
conflicts=("act-${_pkgname}")
provides=("act-${_pkgname}")
source=("git+${url}")
sha512sums=("SKIP")

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -Dm644 ${srcdir}/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    export ACT_HOME="/opt/act-async"
    mkdir -p ${pkgdir}/opt/act-async/act
    mkdir -p ${pkgdir}/opt/act-async/bin
    mkdir -p ${pkgdir}/opt/act-async/conf/generic
    mkdir -p ${pkgdir}/opt/act-async/include
    mkdir -p ${pkgdir}/opt/act-async/lib

    cd ${_pkgname}
    ./configure
    make depend INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"
    make INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"
    make install INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"

}
