# Maintainer: aquova <austinbricker at protonmail dot com>
pkgname="gearcoleco"
pkgver=1.1.0
pkgrel=1
pkgdesc="ColecoVision emulator"
url="https://github.com/drhelius/Gearcoleco"
arch=("x86_64")
license=("GPL3")
depends=('glew' 'sdl2')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("8ade1be2fc55603ceb3894e8cfb6c2ef677136d49b4ac9f6a84ad408dff455e0")

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
