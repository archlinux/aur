# Maintainer: aquova <mail at aquova dot net>

pkgname="gearboy"
pkgver=3.7.1
pkgrel=1
pkgdesc="Game Boy / Gameboy Color emulator"
url="https://github.com/drhelius/Gearboy"
arch=("x86_64")
license=("GPL3")
depends=('glew' 'sdl2')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearboy.desktop"
)
sha256sums=(
    "7ad73c6b7a7bf9b247ff2ed05761a99bf327141041d739f65cbff3f9e34e8403"
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
