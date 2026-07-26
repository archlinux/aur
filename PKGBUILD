# Maintainer: Nosrep <lleerraaff@protonmail.com>
pkgname=zzzclip
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland clipboard manager with history, persistence, and clipboard-as-files"
arch=("x86_64")
url="https://github.com/Osrepnay/zzzclip"
license=("MIT")
depends=(wayland glibc)
optdepends=(
    "fuzzel: history selector"
    "rofi: history selector"
    "wofi: history selector"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Osrepnay/zzzclip/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("881d15c420cc4ced3190da89244b4e2c1a3e9159201f95dfbe4d310e514f1daf")
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    make CFLAGS_EXTRA="$CFLAGS $LDFLAGS"
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
