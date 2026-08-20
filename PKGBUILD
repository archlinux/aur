# SPDX-License-Identifier: GPL-2.0-or-later
#
# Arch Linux PKGBUILD for cidrtools-cffi
# This builds the latest release tag.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='cidrtools-cffi'
pkgdesc='Python CFFI bindings for the cidrtools C-library'
_gitname='cidrtools-cffi'

pkgver="1.0.3"
pkgrel=1
url="https://github.com/gene-git/cidrtools-cffi"

arch=(x86_64)
license=(GPL-2.0-or-later)

depends=(
    'cidrtools'
    'glibc'
    'python>=3.14' 
    'python-cffi'
)
makedepends=(
    'bash'
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
# Used by mkpkg
_mkpkg_depends=(
    'python>minor'
    'python-cffi>minor'
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
