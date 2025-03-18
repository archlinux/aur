# Maintainer: aquova <mail at aquova dot net>

pkgname="gearboy"
pkgver=3.6.1
pkgrel=3
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
    "f3775ce38c7b65a36f8a9cc783b22928d08ef13c3458b3cb0da45dab65cda82e"
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
