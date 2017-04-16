# Maintainer: James Swineson <aur@public.swineson.me>

pkgname=proxmark3-flasher
pkgver=r1688.bb4e6db
pkgrel=1
pkgdesc="Offical proxmark3 flasher"
url="https://github.com/Proxmark/proxmark3/"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=(git make arm-none-eabi-gcc arm-none-eabi-newlib)
depends=(devkitarm termcap)
source=('git+https://github.com/Proxmark/proxmark3.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/proxmark3/client"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/proxmark3/client"
    make
}

package() {
    cd "$srcdir/proxmark3/client"
    mkdir -p $pkgdir/usr/bin
    install flasher $pkgdir/usr/bin/proxmark3-flasher
}
