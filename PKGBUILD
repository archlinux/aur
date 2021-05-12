# Maintainer: Dylan Barker <dthomasbarker@gmail.com>
_pkgname=dwmblocks
pkgname=$_pkgname-dylan-git
pkgver=1.0.r96.7f54246
pkgrel=1
pkgdesc="Dylan's build of modular dwmblocks for X"
arch=('x86_64' 'i686')
url="https://github.com/dylantjb/$_pkgname"
license=('MIT')
depends=('ttf-hack' 'ttf-joypixels' 'libxft-bgra')
makedepends=('make')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    make PREFIX=/usr
}

package() {
    cd $_pkgname
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    mkdir -p ${pkgdir}/opt/${_pkgname}
    cp -rf statusbar ${pkgdir}/opt/${_pkgname}
    chmod 0755 ${pkgdir}/opt/${_pkgname}/statusbar/*
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
