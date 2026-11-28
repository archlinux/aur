#
# PKGBUILD for mkpkg 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='kea_config'
pkgdesc='Manage kea dhcp4 configs from single source config'
_gitname='kea_config'

pkgver="6.10.1"
pkgrel=1
url="https://github.com/gene-git/kea_config"

arch=(any)
license=(GPL-2.0-or-later)
depends=(
    kea
    'python>=3.14' 
    python-dnspython
    python-ruamel-yaml
)

# To build docs uncommont sphinx/texlive
makedepends=(
    git
    meson
    meson-python
    rsync
)

checkdepends=(
    python-pytest
)
# See mkpkg https://github.com/gene-git/Arch-mkpkg
_mkpkg_depends=(
    'python>minor'
    'python-dnspython>major'
    'python-ruamel-yaml>minor'
)

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Key available via keys/pgp, WKD or dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C

#source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}?signed")
source=(
    "git+https://github.com/gene-git/${_gitname}#tag=${pkgver}"
    kea-config.tmpfiles
)
sha256sums=(
    'SKIP'
    '5fcf2cc753e61145f4eb7f42c75265bc5ca378cc1ab29aa965e4adc26d3a4e35'
)

build() {
    cd "${_gitname}"
    echo "------------------"
    echo "  building"
    echo "------------------"
    ./scripts/do-build
}

check() {
    cd "${_gitname}"
    echo "------------------"
    echo "  tests"
    echo "------------------"
    ./scripts/run-tests
}

package() {
    cd "${_gitname}"
    echo "------------------"
    echo "  packaging"
    echo "------------------"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:

