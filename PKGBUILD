# Maintainer: aquova <mail at aquova dot net>

pkgname="gearcoleco"
pkgver=1.5.5
pkgrel=1
pkgdesc="ColecoVision emulator"
url="https://github.com/drhelius/Gearcoleco"
arch=("x86_64")
license=("GPL3")
depends=('gtk3' 'sdl2')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearcoleco.desktop"
)
sha256sums=(
    "08926d3cb31ad00bca78b5c40e3919de85221eac67e3ad8572a492f0e753cffa"
    "b6470e30ab22f01a4819d80015c1892bda401be4684931d8d573a640dc71dd80"
)

build() {
    cd $srcdir/Gearcoleco-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearcoleco-${pkgver}/platforms
    mkdir -p $pkgdir/opt/gearcoleco
    install -Dm755 linux/gearcoleco $pkgdir/opt/gearcoleco
    install -Dm644 gamecontrollerdb.txt $pkgdir/opt/gearcoleco
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/gearcoleco/gearcoleco $pkgdir/usr/bin/gearcoleco
    install -Dm644 $srcdir/gearcoleco.desktop $pkgdir/usr/share/applications/gearcoleco.desktop
}
