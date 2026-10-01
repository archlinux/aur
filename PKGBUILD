# Maintainer: aquova <mail at aquova dot net>

pkgname="gearcoleco"
pkgver=1.7.2
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
    "d095eb1303524a4032c8cfc82b3da7e4eb43ee0880441c740740fdff605d86b1"
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
