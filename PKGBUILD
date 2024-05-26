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

pkgver=3.4.0
pkgrel=1
url="https://github.com/gene-git/ssl-mgr"

arch=(any)
license=(MIT)
# tomli only needed for python < 3.11
depends=('python>3.10' 'python-dnspython' 'python-tomli-w' 'python-cryptography' 
        'python-dateutil' 'python-netaddr' 'lockmgr' 'certbot')
optdepends=('dns_tools: dnssec and dns server manager')

# To build docs uncommont sphinx/texlive
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatch' 'rsync' 'git'
             #'python-sphinx' 'texlive-latexextra' # Docs
            )

_mkpkg_depends=('python>minor')
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
