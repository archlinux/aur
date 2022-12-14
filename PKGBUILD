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

pkgver=4.4.0
pkgrel=1
url="https://github.com/gene-git/kea_config"

arch=(any)
license=(MIT)
# tomli only needed for python < 3.11
depends=('python>3.9' 'python-packaging' 'python-netaddr' 
         'python-tomli-w' 'python-qrcode' 'python-tomli'
        )
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'rsync')
# See mkpkg https://github.com/gene-git/Arch-mkpkg
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
