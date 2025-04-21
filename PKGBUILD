# Maintainer: aquova <mail at aquova dot net>

pkgname="gearsystem"
pkgver=3.8.1
pkgrel=1
pkgdesc="Sega Master System / Game Gear / SG-1000 Emulator"
url="https://github.com/drhelius/Gearsystem"
arch=("x86_64")
license=("GPL3")
depends=('glew' 'sdl2')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearsystem.desktop"
)
sha256sums=(
    "c16c56de877022d8e94e187fcec87f2e2814cd6c119bdb3f008304c7816bb20f"
    "ca638acc5479345aa40fa2baae5e98ebbf97cf6080365e49e11c574dd690f4d1"
)

build() {
    cd $srcdir/Gearsystem-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearsystem-${pkgver}/platforms
    mkdir -p $pkgdir/opt/gearsystem
    install -Dm755 linux/gearsystem $pkgdir/opt/gearsystem
    install -Dm644 gamecontrollerdb.txt $pkgdir/opt/gearsystem
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/gearsystem/gearsystem $pkgdir/usr/bin/gearsystem
    install -Dm644 $srcdir/gearsystem.desktop $pkgdir/usr/share/applications/gearsystem.desktop
}
