# SPDX-License-Identifier: MIT
# SPDX-FileCopyrightText: © 2023-present  Gene C <arch@sapience.com>
#
# Arch Linux PKGBUILD for ssl-mgr 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='ssl-mgr'
pkgdesc='Manage (re)new certificates and handle DANE TLSA key rollover'
_gitname='ssl-mgr'

pkgver="7.2.0"
pkgrel=1
url="https://github.com/gene-git/ssl-mgr"

arch=(any)
license=(GPL-2.0-or-later)
depends=(
    'python>=3.13' 
    'python-dnspython' 
    'python-tomli-w' 
    'python-cryptography' 
    'python-dateutil' 
    'lockmgr' 
    'certbot'
    'pyconcurrent'
    'bash'
)
optdepends=(
    'dns_tools: dnssec and dns server manager'
)

# To build docs uncommont sphinx/texlive
makedepends=(
    'git'
    'rsync'
    'uv'
    'python-uv-build'
    #'python-sphinx' 'texlive-latexextra' # Docs
)

_mkpkg_depends=(
    'python>minor'
    'python-dnspython>minor'
    'python-tomli-w>minor'
    'python-cryptography>minor'
    'python-dateutil>minor'
    'lockmgr>minor'
    'certbot>minor'
    'pyconcurrent>minor'
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
    /usr/bin/rm -f dist/*
    /usr/bin/uv build --wheel --no-build-isolation

    echo 'Building Docs'
    #    pdf='ssl-mgr.pdf'
    #    cd ./Docs
    #    make latexpdf >/dev/null 2>&1
    #    make latexpdf >/dev/null
    #    /usr/bin/rm -f $pdf
    #    /usr/bin/cp _build/latex/$pdf .
    #    make html >/dev/null
    #    make html >/dev/null
    #    /usr/bin/rm -rf _build/doctrees _build/latex


}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
