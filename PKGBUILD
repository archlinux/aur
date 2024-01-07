#
# Arch Linux PKGBUILD for wg-client
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='wg-client'
pkgdesc='Wireguard client. Start/Stop VPN and ssh with remote listener'
_gitname='wg-client'

pkgver=3.7.2
pkgrel=1
url="https://github.com/gene-git/{{project_name}}"

arch=(any)
license=(MIT)

# To build docs uncommont sphinx/texlive
depends=('python>3.10' 'python-pyqt6' 'hicolor-icon-theme' 'python-psutil' 'python-netifaces')
makedepends=('git' 'python-build' 'python-wheel' 'python-hatch' 'rsync'
             #'python-sphinx' 'python-myst-parser' 'texlive-latexextra'
            )

_mkpkg_depends=('python>minor')
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

