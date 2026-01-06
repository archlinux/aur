#
# Arch Linux PKGBUILD for wg_tool 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='wg_tool'
pkgdesc='Manage wireguard VPN configurations (servers and users).'
_gitname='wg_tool'

pkgver="9.2.4"
pkgrel=1
url="https://github.com/gene-git/wg_tool"

arch=(any)
license=('GPL-2.0-or-later')
depends=(
    'python>=3.13' 
    'python-cryptography' 
    'py-cidr'
    'python-qrcode' 
    'wireguard-tools' 
    'nftables'
    'pyconcurrent' 
    'python-yaml'
    'python-dnspython'
    'python-tomli-w'
    'bash'
)
optdepends=(
    'python-argcomplete: For command line option completion'
    )

# To build docs uncommont sphinx/texlive
makedepends=(
    'git' 
    'uv'
    'python-uv-build'
    'rsync'
    #'python-sphinx' 'texlive-latexextra' # Docs
)

_mkpkg_depends=(
    'python>minor'
    'wireguard-tools>minor'
    'python-cryptography>minor'
    'nftables>minor'
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

changelog="Changelog.rst"

build() {
    cd "${_gitname}"
    /usr/bin/rm -f dist/*
    /usr/bin/uv build --wheel --no-build-isolation

    # To build Docs - uncomment these and sphinx makedepends above
    #    echo "Build docs"
    #    pdf='wg_tool.pdf'
    #    cd ./Docs
    #    make latexpdf >/dev/null 2>&1
    #    make latexpdf
    #    /usr/bin/rm -f $pdf
    #    /usr/bin/cp _build/latex/$pdf .
    #    make html
    #    make html
    #    /usr/bin/rm -rf _build/doctrees _build/latex
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
