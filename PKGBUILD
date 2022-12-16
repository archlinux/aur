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

pkgver=4.1.1
pkgrel=1
url="https://github.com/gene-git/Arch-mkpkg"

arch=(any)
license=(MIT)
# tomli only needed for python < 3.11
depends=('python>3.9' 'python-packaging' 'python-tomli' 'python-tomli-w')
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
    ./do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
