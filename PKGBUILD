# Maintainer: aquova <mail at aquova dot net>

pkgname="gearcoleco"
pkgver=1.6.8
pkgrel=1
pkgdesc="ColecoVision emulator"
url="https://github.com/drhelius/Gearcoleco"
arch=("x86_64")
license=("GPL3")
depends=('sdl3')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearcoleco.desktop"
)
sha256sums=(
    "4e375b001f115555aa2a1a0c659eb5f01e0bc03409bd95d3d21787d495c324e3"
    "873e59dd6a517a36163f7dd6473e82e420fe49230195154aef16e570cf62b408"
)

build() {
    cd $srcdir/Gearcoleco-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearcoleco-${pkgver}
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    cd platforms
    mkdir -p $pkgdir/opt/$pkgname
    install -Dm755 linux/gearcoleco $pkgdir/opt/$pkgname
    install -Dm644 shared/gamecontrollerdb.txt $pkgdir/opt/$pkgname
    install -Dm644 macos/image.png $pkgdir/usr/share/pixmaps/$pkgname.png

    mkdir -p $pkgdir/opt/$pkgname/shaders
    install -Dm644 shared/desktop/shaders/* $pkgdir/opt/$pkgname/shaders

    mkdir -p $pkgdir/usr/bin
    ln -s /opt/$pkgname/gearcoleco $pkgdir/usr/bin/$pkgname
    install -Dm644 $srcdir/gearcoleco.desktop $pkgdir/usr/share/applications/gearcoleco.desktop
}
