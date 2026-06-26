# Maintainer: aquova <mail at aquova dot net>

pkgname="gearcoleco"
pkgver=1.6.5
pkgrel=1
pkgdesc="ColecoVision emulator"
url="https://github.com/drhelius/Gearcoleco"
arch=("x86_64")
license=("GPL3")
depends=('sdl3')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearcoleco.desktop"
)
sha256sums=(
    "1ed67dbb510aa174fed04f0fd307df6df6ae29194821e939c4ffef549c0d0050"
    "b6470e30ab22f01a4819d80015c1892bda401be4684931d8d573a640dc71dd80"
)

build() {
    cd $srcdir/Gearcoleco-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearcoleco-${pkgver}/platforms
    mkdir -p $pkgdir/opt/$pkgname
    install -Dm755 linux/gearcoleco $pkgdir/opt/gearcoleco
    install -Dm644 shared/gamecontrollerdb.txt $pkgdir/opt/gearcoleco
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/$pkgname/gearcoleco $pkgdir/usr/bin/$pkgname
    install -Dm644 $srcdir/gearcoleco.desktop $pkgdir/usr/share/applications/gearcoleco.desktop
}
