# SPDX-License-Identifier: MIT
# SPDX-FileCopyrightText: © 2024-present  Gene C <arch@sapience.com>
#
# Arch Linux PKGBUILD for process-mem 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='process-mem'
pkgdesc='Display Memory Used by Process(es)'
_gitname='process-mem'

pkgver=1.4.1
pkgrel=1
url="https://github.com/gene-git/process-mem"

arch=(any)
license=(MIT)

# To build docs uncommont sphinx/texlive
depends=('python>=3.13' 'python-psutil')
makedepends=('git' 'python-build' 'python-wheel' 'python-hatch' 'rsync' 
             'python-docutils'
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

    echo "Build man page"
    cd ./Docs
    make 
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
