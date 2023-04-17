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

pkgver=1.0.0
pkgrel=1
url="https://github.com/gene-git/nginx_passwd"

arch=(any)
license=(MIT)
# tomli only needed for python < 3.11
depends=('python>3.9' 'python-packaging' 'openssl' )
makedepends=('git' 'python-pip' 'python-wheel' 'python-poetry' 'rsync')
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
