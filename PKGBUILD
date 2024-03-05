# Maintainer: aquova <austinbricker at protonmail dot com>
pkgname="gearboy"
pkgver=3.5.0
pkgrel=1
pkgdesc="Game Boy / Gameboy Color emulator"
url="https://github.com/drhelius/Gearboy"
arch=("x86_64")
license=("GPL3")
depends=('glew' 'sdl2')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("1a0533f324918c06fa9428468caa04fa38d73e829a29f2ebbced4c303d44a27f")

build() {
    cd $srcdir/Gearboy-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearboy-${pkgver}/platforms
    mkdir -p "$pkgdir/opt/gearboy"
    install -Dm755 linux/gearboy "$pkgdir/opt/gearboy"
    install -Dm644 gamecontrollerdb.txt "$pkgdir/opt/gearboy"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/gearboy/gearboy" "$pkgdir/usr/bin/gearboy"
}
