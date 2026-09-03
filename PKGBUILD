#
# Arch Linux PKGBUILD for wg-client
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='wg-client'
pkgdesc='Linux Wireguard client (command line and gui)'
_gitname='wg-client'

pkgver="8.0.3"
pkgrel=1
url="https://github.com/gene-git/wg-client"

arch=(x86_64)
license=(GPL-2.0-or-later)

install='wg-client.install'

# To build docs uncommont sphinx/texlive
depends=(
    'python>=3.14'
    python-psutil
    python-dateutil
    pyconcurrent
    py-cidr
    libcap
    glibc
    bash
    wireguard-tools
)
makedepends=(
    gcc
    git
    meson
    meson-python
    rsync
)
# Used by package : mkpkg
_mkpkg_depends=(
    'gcc>minor'
    'python>minor'
    'libcap>minor'
)

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Key available via keys/pgp, WKD or dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C <arch@sapience.com>

source=(
    "git+https://github.com/gene-git/${_gitname}#tag=${pkgver}"
    wg-client.tmpfiles
)
sha256sums=(
    'SKIP'
    'a2d0d2d1f3e59157dbab2aacc213b2cfaf158a1578adc88a811b35afe2407f2f'
)

changelog="Changelog"

prepare() {
    cd "${_gitname}"
}

build() {
    cd "${_gitname}"

    echo 'Building'
    ./scripts/do-build
}

package() {
    cd "${_gitname}"
    depends+=(
        python-pyqt6
        hicolor-icon-theme
    )
    ./scripts/do-install ${pkgdir}

    install -Dm644 ../wg-client.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/wg-client.conf
}
# vim:set ts=4 sts=4 sw=4 et:

