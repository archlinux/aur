# Maintainer: aquova <mail at aquova dot net>

pkgname="gearcoleco"
pkgver=1.6.1
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
    "053b0d645e97de5cec3e0cf0240c6a915482cb3f62a307fa4d8c53be45d79e4b"
    "b6470e30ab22f01a4819d80015c1892bda401be4684931d8d573a640dc71dd80"
)

build() {
    cd $srcdir/Gearcoleco-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearcoleco-${pkgver}/platforms
    mkdir -p $pkgdir/opt/$pkgname
    install -Dm755 linux/gearcoleco $pkgdir/opt/gearcoleco
    install -Dm644 shared/gamecontrollerdb.txt $pkgdir/opt/gearcoleco
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/$pkgname/gearcoleco $pkgdir/usr/bin/$pkgname
    install -Dm644 $srcdir/gearcoleco.desktop $pkgdir/usr/share/applications/gearcoleco.desktop
}
