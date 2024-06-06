# Maintainer: Fabian Posch <aur@posch.tech>

_reponame=utils
_pkgname=act-${_reponame}
pkgname=${_pkgname}-git
_basever=0
_patchlvl=1
_gitversion=r6.51c421a
pkgver=${_basever}.${_patchlvl}.${_gitversion}
pkgrel=1
pkgdesc="Useful scripts for working with the ACT flow."
arch=('x86_64')
url="https://github.com/asyncvlsi/utils"
license=('Apache-2.0')
depends=('act-core' 'python')
makedepends=('git' 'make')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+${url}")
sha512sums=("SKIP")

pkgver() {
    cd ${_reponame}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -Dm644 ${srcdir}/${_reponame}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mkdir -p ${pkgdir}/opt/act-async/bin
    mkdir -p ${pkgdir}/opt/act-async/conf/generic

    cd ${srcdir}/${_reponame}
    make INSTALL_OVERRIDE="${pkgdir}/opt/act-async/" install

    rm -rf ${pkgdir}/opt/act-async/act
    rm -rf ${pkgdir}/opt/act-async/conf
}