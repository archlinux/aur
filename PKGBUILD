#
# Arch Linux PKGBUILD for wg_tool 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='wg_tool'
pkgdesc='Tool to manage wireguard server and users'
_gitname='wg_tool'

pkgver=4.3.0
pkgrel=1
url="https://github.com/gene-git/wg_tool"

arch=(any)
license=(MIT)
# tomli only needed for python < 3.11
depends=('python>3.9' 'python-packaging' 'python-netaddr' 
         'python-tomli-w' 'python-qrcode' 'wireguard-tools'
         'python-tomli'
        )
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'rsync')
_mkpkg_depends=('python>minor')
source=("git+https://github.com/gene-git/${_gitname}")
sha512sums=('SKIP')

pkgver() {
     cd "${_gitname}"
     git describe --tags --abbrev=0
}

build() {
    cd "${_gitname}"
    /usr/bin/rm -f dist/*
    /usr/bin/poetry build --format wheel
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
