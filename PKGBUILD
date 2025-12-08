# Maintainer: aquova <mail at aquova dot net>

pkgname="gearboy"
pkgver=3.7.5
pkgrel=1
pkgdesc="Game Boy / Gameboy Color emulator"
url="https://github.com/drhelius/Gearboy"
arch=("x86_64")
license=("GPL3")
depends=('gtk3' 'sdl2')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearboy.desktop"
)
sha256sums=(
    "380f036105e5896405f9eb932ce6571add4d89c46063c7094b6f2df4833b4f7f"
    "14488a013717c4d59eabd11dd852c167fc7d9eff702a2691f1089317faaf0f24"
)

build() {
    cd $srcdir/Gearboy-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearboy-${pkgver}/platforms
    mkdir -p $pkgdir/opt/gearboy
    install -Dm755 linux/gearboy $pkgdir/opt/gearboy
    install -Dm644 gamecontrollerdb.txt $pkgdir/opt/gearboy
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/gearboy/gearboy $pkgdir/usr/bin/gearboy
    install -Dm644 $srcdir/gearboy.desktop $pkgdir/usr/share/applications/gearboy.desktop
}
