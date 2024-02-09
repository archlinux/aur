#
# Arch Linux PKGBUILD for wg-client
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='wg-client'
pkgdesc='Wireguard linux client (command line and gui)'
_gitname='wg-client'

pkgver=4.1.2
pkgrel=1
url="https://github.com/gene-git/{{project_name}}"

arch=(x86_64)
license=(MIT)

install='wg-client.install'

# To build docs uncommont sphinx/texlive
depends=('python>3.10' 'python-pyqt6' 'hicolor-icon-theme' 'python-psutil' 
         'python-netifaces' 'libcap' 'python-netaddr')
makedepends=('git' 'python-build' 'python-wheel'  'python-installer' 'python-hatch' 'rsync'
             #'python-sphinx' 'python-myst-parser' 'texlive-latexextra'
            )

_mkpkg_depends=('python>minor')
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
    cd "${_gitname}"

    # To build Docs 
    # uncomment these and sphinx makedepends above
    # --------------
    # echo "Build docs"
    # cd ./Docs
    # make html
    # make latexpdf
}

build() {
    cd "${_gitname}"

    echo 'Building python'
    /usr/bin/rm -f dist/*
    /usr/bin/python -m build --wheel --no-isolation

    echo 'Building C-code'
    cd ./src/wg_client/fix-resolv/
    make
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:

