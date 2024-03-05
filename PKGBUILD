# Maintainer: aquova <austinbricker at protonmail dot com>
pkgname="gearsystem"
pkgver=3.5.0
pkgrel=1
pkgdesc="Sega Master System / Game Gear / SG-1000 Emulator"
url="https://github.com/drhelius/Gearsystem"
arch=("x86_64")
license=("GPL3")
depends=('glew' 'sdl2')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("fb284c2c71ab78f5127c5c9b1039dcf18ac518259649ef79900299ac2ea4151f")

build() {
    cd $srcdir/Gearsystem-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearsystem-${pkgver}/platforms
    mkdir -p "$pkgdir/opt/gearsystem"
    install -Dm755 linux/gearsystem "$pkgdir/opt/gearsystem"
    install -Dm644 gamecontrollerdb.txt "$pkgdir/opt/gearsystem"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/gearsystem/gearsystem" "$pkgdir/usr/bin/gearsystem"
}
