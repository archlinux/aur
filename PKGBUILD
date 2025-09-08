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

pkgver=6.3.0
pkgrel=1
url="https://github.com/gene-git/ssl-mgr"

arch=(any)
license=(MIT)
depends=('python>=3.13' 'python-dnspython' 'python-tomli-w' 'python-cryptography>=42' 
        'python-dateutil' 'lockmgr' 'certbot')
optdepends=(
    'dns_tools: dnssec and dns server manager'
    'pyconcurrent: to run external programs instead of local copy'
)

# To build docs uncommont sphinx/texlive
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatch' 'rsync' 'git'
             #'python-sphinx' 'texlive-latexextra' # Docs
            )

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

    # To build Docs - uncomment these and sphinx makedepends above
#    echo "Build docs"
#    cd ./Docs
#    make html
#    make latexpdf
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
