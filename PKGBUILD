# Maintainer: Chinmay Dalal <w5vwg64uy@relay.firefox.com>

pkgname="evremap"
pkgver=1.0
pkgrel=2
pkgdesc="A keyboard input remapper for Linux/Wayland systems, written by @wez"
arch=("x86_64")
url="https://github.com/wez/evremap"
license=("MIT")
depends=("libevdev")
makedepends=("rust" "cargo" "git")
source=("git+https://github.com/wez/evremap.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/evremap"
    cargo build --release
}

package() {
    install -D -m755 "$srcdir/evremap/target/release/$pkgname" "$pkgdir/usr/bin/evremap"
    install -D -m644 "$srcdir/evremap/evremap.service" "$pkgdir/usr/lib/systemd/system/evremap.service"
    echo "Edit evremap.service according to your needs, see https://wiki.archlinux.org/title/Systemd#Editing_provided_units"
}
