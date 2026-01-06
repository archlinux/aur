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

pkgver="2.13.1"
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
    'uv' 
    'python-uv-build' 
    'rsync' 
    #'python-sphinx' 'python-myst-parser' 'texlive-latexextra' 'python-sphinx-autoapi' 
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
    /usr/bin/rm -f dist/*
    /usr/bin/uv build --wheel --no-build-isolation

    # To build Docs 
    # uncomment these and sphinx makedepends above
    # --------------
    #  echo "Build docs"
    #  cd ./Docs
    #  pdf='pyconcurrent.pdf'
    #  /usr/bin/rm -f $pdf
    #  make latexpdf >/dev/null 2>&1
    #  make latexpdf >/dev/null
    #  make html
    #  make html
    #  /usr/bin/cp _build/latex/$pdf .
    #  /usr/bin/rm -rf _build/doctrees _build/latex autoapi

}

check() {
    cd "${_gitname}/tests"
    PYTHONPATH=../src /usr/bin/pytest
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
