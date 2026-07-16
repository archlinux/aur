# Maintainer: Alia_Atreides <mmurphy four zero nine six at gmail dot com>

pkgname=ps3mca-ps1-git
pkgver=r78.f07c9f3
pkgrel=1
pkgdesc='Command line utility to manage Playstation 1 Memory Cards using the PS3 Memory Card Adapter'
url='https://github.com/paolo-caroni/ps3mca-ps1'
arch=("x86_64")
license=("GPL-3.0-or-later")
depends=('libusb' 'ps3mca-udev-rules')
makedepends=('git')
source=(
    "git+https://github.com/paolo-caroni/ps3mca-ps1"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd $srcdir/ps3mca-ps1
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/ps3mca-ps1
    export CFLAGS+=" $(pkg-config --cflags libusb-1.0)"
    export LDFLAGS+=" $(pkg-config --libs libusb-1.0)"
    make
}

package() {

    install -Dm755 $srcdir/ps3mca-ps1/ps3mca-ps1 $pkgdir/usr/bin/ps3mca-ps1
}
