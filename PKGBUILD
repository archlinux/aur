# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

_pkgname=KindleTool
pkgname=kindletool-git
pkgver=1.6.5.r147.geecbcb6
pkgrel=2
pkgdesc="Tool for creating/extracting Kindle updates and more"
arch=('i686' 'x86_64')
url="https://github.com/NiLuJe/${_pkgname}"
license=('GPL')
depends=('libarchive' 'nettle')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}/" install
}
