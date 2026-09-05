#
# Arch Linux PKGBUILD for dns_tools 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='dns_tools'
pkgdesc='DNS Tools for managing DNSSEC aka easy dnssec'
_gitname='dns_tools'

pkgver="5.3.0"
pkgrel=1
url="https://github.com/gene-git/dns_tools"

arch=(any)
license=(GPL-2.0-or-later)
depends=(
    'python>=3.14' 
    'ldns' 
    'lockmgr'
    'pyconcurrent'
    'bash'
)
optdepends=(
)

# To build docs uncommont sphinx/texlive
makedepends=(
    'git'
    'meson'
    'meson-python'
    'rsync'
)
checkdepends=(
    'python-pytest' 
    'python-pytest-asyncio'
)
_mkpkg_depends=(
    'python>minor'
    'ldns'
    'lockmgr'
)

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Key available via keys/pgp, WKD or dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C

#source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}?signed")
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

build() {
    cd "${_gitname}"

    ./scripts/do-build
}

check() {
    cd "${_gitname}"
    ./scripts/run-tests
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
