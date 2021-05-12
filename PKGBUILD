# Maintainer: Dylan Barker <dthomasbarker@gmail.com>
_pkgname=slock
pkgname=$_pkgname-dylan-git
pkgver=1.4.r125.6d24ea1
pkgrel=1
pkgdesc="Dylan's build of simple screen locker utility for X"
arch=('x86_64' 'i686')
url="https://github.com/dylantjb/$_pkgname"
license=('MIT/X Consortium License')
makedepends=('git' 'make')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "1.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_pkgname
    sed "/user  =/s/nobody/$USER/" -i config.h
}

build() {
    cd $_pkgname
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd $_pkgname
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
