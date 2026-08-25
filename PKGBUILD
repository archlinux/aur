# SPDX-License-Identifier: GPL-2.0-or-later
#
# Arch Linux PKGBUILD for py-cidr 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='py-cidr'
pkgdesc='Python module providing network / CIDR tools'
_gitname='py-cidr'

pkgver="5.0.2"
pkgrel=1
url="https://github.com/gene-git/py-cidr"

arch=(any)
license=(GPL-2.0-or-later)

# To build docs uncommont sphinx/texlive
depends=(
    'glibc'
    'python>=3.14' 
    'lockmgr'
    'patricia26'
    'python-pytricia'           # Keep (for now) to convert old CidrMaps (Pytricia to Patricia26)
    'cidrtools-cffi'
)
makedepends=(
    'cython'
    'gcc'
    'git'
    'meson'
    'meson-python'
    'uv'
    'python-uv-build'
    'rsync'
)
checkdepends=(
    'python-pytest' 
    'python-pytest-asyncio'
)
# Used by package : mkpkg
_mkpkg_depends=(
    'python>minor'
    'lockmgr>minor'
    'patricia26>minor'
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
