#
# PKGBUILD for build mkpkg 
# Recommended version is git HEAD, this is well tested before repo updated.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='mkpkg'
pkgdesc='Tool to rebuild packages based on dependency triggers (git)'
_gitname='Arch-mkpkg'
_branch='master'

pkgver=2.3.0.r4.g65081dbd9f
pkgrel=1
url="https://github.com/gene-git/Arch-mkpkg"

arch=(any)
license=(MIT)
depends=('python')
makedepends=('python' 'python-pip' 'python-poetry')
_mkpkg_depends=('python>minor')
source=("git+https://github.com/gene-git/${_gitname}")
sha512sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g' 
}

prepare() {
    cd "${_gitname}"
    git fetch
    git clean -f
    git pull origin $_branch
}

build() {
    cd "${_gitname}"
    poetry build
}

package() {
    cd "${_gitname}"
    ./do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
