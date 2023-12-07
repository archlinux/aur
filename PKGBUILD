#
# Arch Linux PKGBUILD for wg_tool 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='wg_tool'
pkgdesc='Tool to administer wireguard VPN (server and user configs)'
_gitname='wg_tool'

pkgver=5.6.0
pkgrel=1
url="https://github.com/gene-git/wg_tool"

arch=(any)
license=(MIT)
# tomli only needed for python < 3.11
depends=('python>3.9' 'python-packaging' 'python-netaddr' 
         'python-tomli-w' 'python-qrcode' 'wireguard-tools'
         'python-tomli'
        )
# To build docs uncommont sphinx/texlive
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatch' 'rsync'
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
