# Maintainer: aquova <mail at aquova dot net>

pkgname="gearsystem"
pkgver=3.6.1
pkgrel=1
pkgdesc="Sega Master System / Game Gear / SG-1000 Emulator"
url="https://github.com/drhelius/Gearsystem"
arch=("x86_64")
license=("GPL3")
depends=('glew' 'sdl2')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("01562521cd809243503e561374ba02182790063045fb94ef5acf5d0e89219456")

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
