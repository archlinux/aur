# Maintainer: aquova <mail at aquova dot net>

pkgname="gearsystem"
pkgver=3.8.6
pkgrel=1
pkgdesc="Sega Master System / Game Gear / SG-1000 Emulator"
url="https://github.com/drhelius/Gearsystem"
arch=("x86_64")
license=("GPL3")
depends=('gtk3' 'sdl2')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearsystem.desktop"
)
sha256sums=(
    "95f1687744900b0cd322cc04e84324d6b730467a6105c1799874904b3aa77555"
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
