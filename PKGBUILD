# Maintainer: aquova <mail at aquova dot net>

pkgname="gearboy"
pkgver=3.8.12
pkgrel=1
pkgdesc="Game Boy / Gameboy Color emulator"
url="https://github.com/drhelius/Gearboy"
arch=("x86_64")
license=("GPL3")
depends=('sdl3')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearboy.desktop"
)
sha256sums=(
    "d9c4b1513de7c4dc3ca627f38e2c774179f60c437c684f9ac0eb3572bf037a11"
    "2508710d17e920a5d179c3c4ac737e240aec766eb8d63347f11eda00d7123de9"
)

build() {
    cd $srcdir/Gearboy-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearboy-$pkgver
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    cd platforms
    mkdir -p $pkgdir/opt/$pkgname
    install -Dm755 linux/gearboy $pkgdir/opt/$pkgname
    install -Dm644 shared/gamecontrollerdb.txt $pkgdir/opt/$pkgname
    install -Dm644 macos/image.png $pkgdir/usr/share/pixmaps/$pkgname.png

    mkdir -p $pkgdir/opt/$pkgname/shaders
    install -Dm644 shared/desktop/shaders/* $pkgdir/opt/$pkgname/shaders

    mkdir -p $pkgdir/usr/bin
    ln -s /opt/$pkgname/gearboy $pkgdir/usr/bin/$pkgname
    install -Dm644 $srcdir/gearboy.desktop $pkgdir/usr/share/applications/gearboy.desktop
}
