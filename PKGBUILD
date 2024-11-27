# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='inherit-acl'
_pkgverUpstream="0.1.3"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=2
pkgdesc="Tool that applies to a path its parent directory's permissions and ACL"
arch=('any')
url='https://www.eomanis.dedyn.io/permshare/inherit-acl/'
license=('GPL3')
depends=('bash>=4.3' 'coreutils' 'sed' 'acl')
optdepends=('sudo: Sudo integration')
source=("https://www.eomanis.dedyn.io/permshare/inherit-acl/inherit-acl-${_pkgverUpstream}.tar.gz")
sha384sums=('905bdc59b7babd0a414683143777d54a830297310bbcfee6815d364bd3a679a75eb2b6241c1fa8bd4e031dc05d9bbd2f')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

    # Place the main bash scripts into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin" || return 1
    cp -t . "${srcRootDir}/inherit-acl"
    chmod u=rwx,go=rx "inherit-acl"
    cp -t . "${srcRootDir}/inherit-acl-run"
    chmod u=rwx,go=rx "inherit-acl-run"
}
