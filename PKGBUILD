#
# Arch Linux PKGBUILD for wg_tool 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='wg_tool'
pkgdesc='Manages wireguard VPN configuration (servers and users).'
_gitname='wg_tool'

pkgver=9.0.1
pkgrel=1
url="https://github.com/gene-git/wg_tool"

arch=(any)
license=('GPL-2.0-or-later')
depends=('python>=3.13' 'python-cryptography' 'py-cidr'
         'python-qrcode' 'wireguard-tools' 'nftables'
         'pyconcurrent' 'python-yaml'
         'python-dnspython'
        )
optdepends=(
    'python-argcomplete: For command line option completion'
    )

# To build docs uncommont sphinx/texlive
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatch' 'rsync'
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

changelog="Changelog.rst"

build() {
    cd "${_gitname}"
    /usr/bin/rm -f dist/*
    /usr/bin/python -m build --wheel --no-isolation

    # To build Docs - uncomment these and sphinx makedepends above
#    echo "Build docs"
#    cd ./Docs
#    make latexpdf > /dev/null ; make latexpdf > /dev/null
#    make html > /dev/null
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
