# Maintainer: Fabian Posch <aur@posch.tech>

pkgname=act-stdlib-git
pkgver=0.0.1.r62.99d8416
pkgrel=4
pkgdesc="ACT stdlib provides the base ACT libraries which the rest of the toolchain uses."
arch=('x86_64')
url="https://github.com/asyncvlsi/stdlib"
license=('Apache-2.0')
depends=('act-core')
makedepends=('git' 'make')
conflicts=('act-stdlib')
provides=('act-stdlib')
source=("git+${url}")
sha512sums=(
    "SKIP"
)

pkgver() {
    cd stdlib
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -Dm644 "${srcdir}/stdlib/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    export ACT_HOME="/opt/act-async"
    mkdir -p ${pkgdir}/opt/act-async/act
    mkdir -p ${pkgdir}/opt/act-async/conf/generic

    cd stdlib
    make install INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"

    rm -r ${pkgdir}/opt/act-async/conf
}