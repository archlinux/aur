# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=sixaxis-tools
pkgver=0.1.0
pkgrel=1
pkgdesc="User-mode Sony Sixaxis pairing tools (CLI, ncurses, GTK3/XApp), wrapping sixpair"
arch=('x86_64')
url="https://github.com/Twilight0/sixaxis-tools"
license=('GPL-2.0-or-later')
depends=('libusb-compat' 'ncurses' 'gtk3' 'xapp')
makedepends=('pkgconf' 'gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/sixaxis-tools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e52deaa8a04cd51803c88ce277a4920fca78a425ba8b73541e4ea0af56bbbabc')
install=sixaxis-tools.install

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 sixaxis-ctrl "$pkgdir/usr/bin/sixaxis-ctrl"
    install -Dm755 sixaxis-tui "$pkgdir/usr/bin/sixaxis-tui"
    install -Dm755 sixaxis-gtk "$pkgdir/usr/bin/sixaxis-gtk"
    # udev rule: lets the tools open the controller as a regular user
    install -Dm644 99-sixaxis.rules "$pkgdir/usr/lib/udev/rules.d/99-sixaxis.rules"
}
