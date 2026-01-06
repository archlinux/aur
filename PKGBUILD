#
# PKGBUILD for mkpkg 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='kea_config'
pkgdesc='Manage kea dhcp4 configs from single source config'
_gitname='kea_config'

pkgver="5.2.2"
pkgrel=1
url="https://github.com/gene-git/kea_config"

arch=(any)
license=(GPL-2.0-or-later)
depends=(
    'python>=3.13' 
    'python-dnspython'
)

# To build docs uncommont sphinx/texlive
makedepends=(
    'git'
    'uv'
    'python-uv-build'
    'rsync'
    #'python-sphinx' 'texlive-latexextra' # Docs
)
# See mkpkg https://github.com/gene-git/Arch-mkpkg
_mkpkg_depends=(
    'python>minor'
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

    # To build Docs - uncomment these and sphinx makedepends above
    # echo "Build docs"
    # cd ./Docs
    # pdf='kea_config.pdf'
    # /usr/bin/rm -f $pdf
    # make latexpdf >/dev/null 2>&1
    # make latexpdf
    # /usr/bin/cp _build/latex/$pdf .
    # make html
    # make html
    # /usr/bin/rm -rf _build/doctrees _build/latex
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:

