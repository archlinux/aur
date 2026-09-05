#
# Arch Linux PKGBUILD for iwinfo 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='iwinfo'
pkgdesc='Provide wifi information about capabilities and network(s)'
_gitname='iwinfo'

pkgver="5.1.1"
pkgrel=1
url="https://github.com/gene-git/iwinfo"

arch=(x86_64)
license=(GPL-2.0-or-later)

install='iwinfo.install'

# To build docs uncomment sphinx/texlive
# Note libcap_ng >= 0.6 provides python bindings
depends=(
    'python>=3.14' 
    'libcap-ng>=0.9' 
    'pyconcurrent'
    'iwd'
    'glibc'
)
makedepends=(
    'git' 
    'meson'
    'meson-python'
    'rsync'
)

_mkpkg_depends=(
    'python>minor' 
    'libcap-ng>minor'
    'python-capng>minor'
    'glibc>minor'
    'gcc>minor'
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

    echo "------------------"
    echo "   building"
    echo "------------------"

    ./scripts/do-build
}

package() {
    cd "${_gitname}"
    echo "------------------"
    echo "   install"
    echo "------------------"
    ./scripts/do-install ${pkgdir}
}
