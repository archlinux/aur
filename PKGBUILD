#
# PKGBUILD for mkpkg 
# This builds the latest release tag.
# git HEAD is well also well tested before any repo change.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='mkpkg'
pkgdesc='Tool to rebuild packages based on dependency triggers'
_gitname='Arch-mkpkg'

pkgver="8.1.0"
pkgrel=1
url="https://github.com/gene-git/Arch-mkpkg"

arch=(any)
license=(GPL-2.0-or-later)
depends=(
    'python>=3.14' 
    pyalpm
    python-tomli-w
    python-pyelftools
    python-pyconcurrent
)

makedepends=(
    git
    meson
    meson-python
    rsync
    bash
)
_mkpkg_depends=(
    'python>minor'
)

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Pub key available keys/pgp, WKD or dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#

#source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}?signed")
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C)
sha512sums=('SKIP')

build() {
    cd "${_gitname}"

    ./scripts/do-build
}

package() {
    cd "${_gitname}"

    ./scripts/do-install ${pkgdir}
}
