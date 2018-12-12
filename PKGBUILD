# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

_gitname=captain-frank-cursors
pkgname=captain-frank-cursors-git
pkgver=r18.78d8511
pkgrel=2
pkgdesc="An x-cursor theme heavily based on capitaine cursors and elementary (Mint) for use on KDE desktop"
arch=('any')
url="https://github.com/ChrisP4/${_gitname}"
license=('GPL3')
makedepends=(git inkscape)
options=('!strip')
conflicts=(${_gitname})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd $_gitname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_gitname
    rm -rf ./dist
    chmod +x ./build.sh
    ./build.sh
}

package() {
    install -d ${pkgdir}/usr/share/icons/${_gitname}
    cp -rf ${srcdir}/${_gitname}/dist/* ${pkgdir}/usr/share/icons/${_gitname}
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr -type f -name '.directory' -delete
}
