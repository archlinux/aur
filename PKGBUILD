#
# Arch Linux PKGBUILD for nginx-passwd 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='nginx_passwd'
pkgdesc='Basic Auth Password File Manager for nginx'
_gitname='nginx_passwd'

pkgver="4.0.2"
pkgrel=1
url="https://github.com/gene-git/nginx_passwd"

arch=(any)
license=(GPL-2.0-or-later)

depends=(
    'python>=3.14'
    'python-passlib'
    'python-bcrypt'
    'python-argon2_cffi'
    'python-cryptography'
)

# To build docs uncommont sphinx/texlive
makedepends=(
    'git'
    'meson'
    'meson-python'
    'rsync'
    'bash'
            )
checkdepends=(
    'python-pytest' 
    'python-pytest-asyncio'
    'python-pyconcurrent'
)

_mkpkg_depends=(
    'python>minor'
    'python-cryptography'
    'python-argon2_cffi'
    'python-bcrypt'
    'python-passlib'
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

    ./scripts/do-build
}

check() {
    cd "${_gitname}"
    
    ./scripts/run-tests
}

package() {
    cd "${_gitname}"

    ./scripts/do-install ${pkgdir}
}
