# Maintainer: Fabian Posch <aur@posch.tech>

pkgname=act-stdlib-git
pkgver=0.0.1.r62.99d8416
pkgrel=3
pkgdesc="ACT stdlib provides the base ACT libraries which the rest of the toolchain uses."
arch=('x86_64')
url="https://github.com/asyncvlsi/stdlib"
license=('Apache-2.0')
depends=('act-core')
makedepends=('git' 'make')
conflicts=('act-stdlib')
provides=('act-stdlib')
source=("git+${url}" "LICENSE")
sha512sums=(
    "SKIP"
    "810991a9bd90053dfc749cdcffd542cce34fa989c5e2b7e45d50dded3072f2e78055448def8c5dd5b33c212ed6890a73adfff737827e14733308f37bad06a5f3"  
)

pkgver() {
    cd stdlib
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    export ACT_HOME="/opt/act-async"
    mkdir -p ${pkgdir}/opt/act-async/act
    mkdir -p ${pkgdir}/opt/act-async/conf/generic

    cd stdlib
    make install INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"

    rm -r ${pkgdir}/opt/act-async/conf
}