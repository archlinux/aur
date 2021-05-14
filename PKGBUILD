# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-rgb-sdk
pkgname=${_pkgname}-git
pkgver=r105.bfadbce
pkgrel=1
pkgdesc="Customize colors on Wooting Keyboard #WootDev"
arch=('any')
url="https://github.com/WootingKb/$_pkgname"
license=('MPL2')
depends=('libusb')
makedepends=('git' 'hidapi' 'libusb')
provides=("libwooting-rgb-sdk" $_pkgname)
conflicts=("libwooting-rgb-sdk")
source=("git+$url.git#branch=feature/lekker-support")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname/linux"

    CFLAGS+=" -fPIC" prefix="$pkgdir/usr" make install
}
