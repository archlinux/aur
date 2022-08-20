# Maintainer: aquova <austinbricker at protonmail dot com>
pkgname="gearboy"
pkgver=3.4.0
pkgrel=2
pkgdesc="Game Boy / Gameboy Color emulator"
url="https://github.com/drhelius/Gearboy"
arch=("x86_64")
license=("GPL3")
depends=('glew-2.1' 'sdl2')
source=("${url}/archive/refs/tags/gearboy-${pkgver}.tar.gz")
sha256sums=("d407a0ab090f4db33a244606af2136c71737c58e61d684fdbcb4881aa1133b9c")

build() {
    cd $srcdir/Gearboy-gearboy-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearboy-gearboy-${pkgver}/platforms/linux
    mkdir -p "$pkgdir/opt/gearboy"
    install -Dm755 gearboy "$pkgdir/opt/gearboy"
    install -Dm644 gamecontrollerdb.txt "$pkgdir/opt/gearboy"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/gearboy/gearboy" "$pkgdir/usr/bin/gearboy"
}
