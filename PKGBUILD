# SPDX-License-Identifier: GPL-2.0-or-later
# SPDX-FileCopyrightText: © 2025-present Gene C <arch@sapience.com>
#
# Arch Linux PKGBUILD for pyconcurrent
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='pyconcurrent'
pkgdesc='Python module to simplify asyncio/multiprocessing'
_gitname='pyconcurrent'

pkgver="3.0.0"
pkgrel=1
url="https://github.com/gene-git/pyconcurrent"

arch=(any)
license=(GPL-2.0-or-later)

# To build docs uncommont sphinx/texlive
depends=(
    'python>=3.13'
    'python-dateutil'
)
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
# Used by package : mkpkg
_mkpkg_depends=('python>minor')

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
