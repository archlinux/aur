# Maintainer: aquova <mail at aquova dot net>

pkgname="gearsystem"
pkgver=3.9.2
pkgrel=1
pkgdesc="Sega Master System / Game Gear / SG-1000 Emulator"
url="https://github.com/drhelius/Gearsystem"
arch=("x86_64")
license=("GPL3")
depends=('gtk3' 'sdl3')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearsystem.desktop"
)
sha256sums=(
    "35da980fb305f58517cdbff315d43410a457c9ff9b166f8ddfb6492f5e574a95"
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
    install -Dm644 shared/gamecontrollerdb.txt $pkgdir/opt/gearsystem
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/gearsystem/gearsystem $pkgdir/usr/bin/gearsystem
    install -Dm644 $srcdir/gearsystem.desktop $pkgdir/usr/share/applications/gearsystem.desktop
}
