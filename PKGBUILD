# Maintainer: dhor <dhor@toxic.net.pl>

pkgname=calibraw
pkgver=1.2.0
pkgrel=1
pkgdesc="CalibRaw is a fast, non-destructive, GPU-accelerated RAW photo editor"
arch=('x86_64')
url="https://github.com/Duecki1/CalibRaw"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'clang' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Duecki1/CalibRaw/archive/refs/tags/v$pkgver.tar.gz" 
	"CalibRawIcon.png"
	"calibraw.desktop"
	)
sha256sums=('39af43a7a1f00ad6c2d6ee4df6b423f50a3a717a5437119bc09975287d45647a'
            '83a6cd9b48d31d911d1e360b1a21d730b2c73d181b65978d9b311731ef4490d9'
            '34866ea9492e71788b89367ee08e49b62b019268ebb64e1f919aea0e1cacbf85')

build() {
    cd "$srcdir/CalibRaw-$pkgver"

    cargo build \
        -p calibraw-ui \
        --bin calibraw \
        --release
}

package() {
    cd "$srcdir/CalibRaw-$pkgver"

    install -Dm755 \
        target/release/calibraw \
        "$pkgdir/usr/bin/calibraw"

    install -Dm644 \
	$srcdir/CalibRawIcon.png \
	"$pkgdir/usr/share/icons/hicolor/512x512/apps/calibraw.png"


    install -Dm644 \
        "$srcdir/calibraw.desktop" \
        "$pkgdir/usr/share/applications/calibraw.desktop"

}
