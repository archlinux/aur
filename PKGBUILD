# Maintainer: aquova <mail at aquova dot net>

pkgname="gearlynx"
pkgver=1.2.14
pkgrel=1
pkgdesc="Atari Lynx Emulator and Debugger"
url="https://github.com/drhelius/Gearlynx"
arch=("x86_64")
license=("GPL3")
depends=('sdl3')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearlynx.desktop"
)
sha256sums=(
    "c199ba815c90b52e75feb890b81b3724b7152331f95d6d668ae16e844b7cff50"
    "99b4dbf55dfc8071a541237029079c68f34ea11d67c25e2ffa4525e7c3e9086b"
)

build() {
    cd $srcdir/Gearlynx-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearlynx-${pkgver}/platforms
    mkdir -p $pkgdir/opt/$pkgname
    install -Dm755 linux/gearlynx $pkgdir/opt/$pkgname
    install -Dm644 shared/gamecontrollerdb.txt $pkgdir/opt/$pkgname
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/$pkgname/gearlynx $pkgdir/usr/bin/$pkgname
    install -Dm644 $srcdir/gearlynx.desktop $pkgdir/usr/share/applications/gearlynx.desktop
}
