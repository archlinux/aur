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

pkgver=1.0.0
pkgrel=1
url="https://github.com/gene-git/process-mem"

arch=(any)
license=(MIT)

# To build docs uncommont sphinx/texlive
depends=('python>=3.11')
makedepends=('git' 'python-build' 'python-wheel' 'python-hatch' 'rsync' 
             'python-docutils'
            )

# Used by package : mkpkg
_mkpkg_depends=('python>minor')

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
