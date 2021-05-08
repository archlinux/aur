# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-rgb-sdk
pkgname=${_pkgname}-git
pkgver=r102.5da2ac1
pkgrel=1
pkgdesc="Customize colors on Wooting Keyboard #WootDev"
arch=('any')
url="https://github.com/WootingKb/$_pkgname"
license=('MPL2')

provides=($_pkgname)
source=("git+$url.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname/linux"

    make CFLAGS='-Wall -g -fPIC'
}

package() {
    cd "$srcdir/$_pkgname/linux"

    install -Dm644 libwooting-rgb-sdk.pc $pkgdir/usr/local/lib/pkgconfig/libwooting-rgb-sdk.pc
    install -Dm644 libwooting-rgb-sdk.so $pkgdir/usr/local/lib/libwooting-rgb-sdk.so
    install -Dm644 ../src/wooting-rgb-sdk.h $pkgdir/usr/local/include/wooting-rgb-sdk.h
    install -Dm644 ../src/wooting-usb.h $pkgdir/usr/local/include/wooting-usb.h
}
