# Maintainer: Fabian Posch <aur@posch.tech>

pkgname=act-actsim-git
pkgver=0.0.1.r598.2f3fa34
pkgrel=1
pkgdesc="A mixed-signal simulator capable of simulating ACT files."
arch=('x86_64')
url="https://github.com/asyncvlsi/actsim"
license=('GPL-2.0')
depends=('act-core' 'act-stdlib' 'act-tracelib')
makedepends=('git' 'make' 'gcc')
conflicts=('act-actsim')
provides=('act-actsim')
source=("git+${url}")
sha512sums=("SKIP")

pkgver() {
    cd actsim
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -Dm644 ${srcdir}/actsim/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    export ACT_HOME="/opt/act-async"
    mkdir -p ${pkgdir}/opt/act-async/act
    mkdir -p ${pkgdir}/opt/act-async/bin
    mkdir -p ${pkgdir}/opt/act-async/conf/generic
    mkdir -p ${pkgdir}/opt/act-async/include
    mkdir -p ${pkgdir}/opt/act-async/lib

    cd actsim
    ./configure
    make depend INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"
    make INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"
    make install INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"

}