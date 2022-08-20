# Maintainer: aquova <austinbricker at protonmail dot com>
pkgname="gearsystem"
pkgver=3.4.1
pkgrel=2
pkgdesc="Sega Master System / Game Gear / SG-1000 Emulator"
url="https://github.com/drhelius/Gearsystem"
arch=("x86_64")
license=("GPL3")
depends=('glew-2.1' 'sdl2')
source=("${url}/archive/refs/tags/gearsystem-${pkgver}.tar.gz")
sha256sums=("c71c8415d18afee104aece2b04de0b6736dd2783b0c87b9a6a2bee9530d2d798")

build() {
    cd $srcdir/Gearsystem-gearsystem-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearsystem-gearsystem-${pkgver}/platforms/linux
    mkdir -p "$pkgdir/opt/gearsystem"
    install -Dm755 gearsystem "$pkgdir/opt/gearsystem"
    install -Dm644 gamecontrollerdb.txt "$pkgdir/opt/gearsystem"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/gearsystem/gearsystem" "$pkgdir/usr/bin/gearsystem"
}
