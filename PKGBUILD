# Maintainer: aquova <mail at aquova dot net>

pkgname="gearcoleco"
pkgver=1.3.1
pkgrel=1
pkgdesc="ColecoVision emulator"
url="https://github.com/drhelius/Gearcoleco"
arch=("x86_64")
license=("GPL3")
depends=('glew' 'sdl2')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("53bc46b67113337926817fc288df62218b6c815aa619791804c261170ab8b970")

build() {
    cd $srcdir/Gearcoleco-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearcoleco-${pkgver}/platforms
    mkdir -p "$pkgdir/opt/gearcoleco"
    install -Dm755 linux/gearcoleco "$pkgdir/opt/gearcoleco"
    install -Dm644 gamecontrollerdb.txt "$pkgdir/opt/gearcoleco"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/gearcoleco/gearcoleco" "$pkgdir/usr/bin/gearcoleco"
}
