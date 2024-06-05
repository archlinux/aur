# Maintainer: Fabian Posch <aur@posch.tech>

pkgname=act-tracelib-git
pkgver=0.0.1.r29.c8af854
pkgrel=2
pkgdesc="A simulation trace file writer interface."
arch=('x86_64')
url="https://github.com/asyncvlsi/tracelib"
license=('LGPL-2.1')
depends=('act-core')
makedepends=('git' 'make' 'binutils' 'gcc')
conflicts=('act-tracelib')
provides=('act-tracelib')
source=("git+${url}")
sha512sums=("SKIP")

pkgver() {
    cd tracelib
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -Dm644 ${srcdir}/tracelib/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    export ACT_HOME="/opt/act-async"
    mkdir -p "${pkgdir}/opt/act-async/conf/generic"
    mkdir -p "${pkgdir}/opt/act-async/include/act"
    mkdir -p "${pkgdir}/opt/act-async/lib"

    cd tracelib
    make INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"
    make install INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"

    rm -rf "${pkgdir}/opt/act-async/conf"
    rm -rf "${pkgdir}/opt/act-async/act"

}