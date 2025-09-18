# Maintainer: aquova <mail at aquova dot com>

pkgname="cbconvert"
pkgver=1.1.0
pkgrel=1
pkgdesc="CBconvert is a Comic Book converter"
url="https://github.com/gen2brain/cbconvert"
arch=("x86_64")
license=("GPL3")
depends=("gtk3")
makedepends=("go")
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "cbconvert.desktop"
)
sha256sums=(
    "1256d2583b79dc6a42b1a54d5051bf1cef7160910dcaaa3d9ae0ea87842e7e84"
    "1e7bbaf6fca37f865f59d1f870386c63faab91a57a2d9ce60fa800ffcf4bea15"
)

build() {
    cd $srcdir/cbconvert-$pkgver/cmd/cbconvert
    go build
    cd $srcdir/cbconvert-$pkgver/cmd/cbconvert-gui
    go build
}

package() {
    install -Dm755 $srcdir/cbconvert-$pkgver/cmd/cbconvert/cbconvert $pkgdir/usr/bin/cbconvert
    install -Dm755 $srcdir/cbconvert-$pkgver/cmd/cbconvert-gui/cbconvert-gui $pkgdir/usr/bin/cbconvert-gui
    install -Dm644 $srcdir/cbconvert.desktop -t $pkgdir/usr/share/applications
    install -Dm644 $srcdir/cbconvert-$pkgver/COPYING -t $pkgdir/usr/share/licenses/cbconvert
}
