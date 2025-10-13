# SPDX-License-Identifier: MIT
# SPDX-FileCopyrightText: © 2025-present  Gene C <arch@sapience.com>
#
# Arch Linux PKGBUILD for netcheck 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='netcheck'
pkgdesc='Check network connectivity'
_gitname='netcheck'

pkgver=1.9.2
pkgrel=1
url="https://github.com/gene-git/netcheck"

arch=(any)
license=(MIT)

# To build docs uncommont sphinx/texlive
depends=('python>3.13'
         'python-pandas'
         'python-matplotlib'
         'pyconcurrent'
         'python-dateutil')

makedepends=('git' 'python-build' 'python-wheel' 'python-hatch' 'rsync' 
             #'python-sphinx' 'python-myst-parser' 'texlive-latexextra'
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
    /usr/bin/rm -f dist/*
    /usr/bin/python -m build --wheel --no-isolation

    # To build Docs 
    # uncomment these and sphinx makedepends above
    # --------------
    # echo "Build docs"
    # cd ./Docs
    # make html
    # make latexpdf
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
