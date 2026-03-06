# Maintainer: Vasily <105429138+vasilews@users.noreply.github.com>
#
pkgname=honor-fmi721-kbd-dkms
pkgver=1.0.0
pkgrel=1
pkgdesc="Keyboard backlight driver for Honor MagicBook X14 Plus 2024 (FMI-721)"
arch=('x86_64')
url="https://github.com/vasilews/honor-fmi721-kbd"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: build module for default kernel'
            'linux-lts-headers: build module for LTS kernel')
install=${pkgname}.install
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "honor-fmi721-kbd"
    
    local install_dir="$pkgdir/usr/src/${pkgname}-${pkgver}"

    install -Dm644 honor_fmi721_kbd.c "$install_dir/honor_fmi721_kbd.c"
    install -Dm644 Makefile "$install_dir/Makefile"
    install -Dm644 dkms.conf "$install_dir/dkms.conf"

    install -Dm644 90-honor-fmi721-kbd.rules \
        "$pkgdir/usr/lib/udev/rules.d/90-honor-fmi721-kbd.rules"

    install -Dm644 honor-fmi721-kbd.conf \
        "$pkgdir/usr/lib/modules-load.d/honor-fmi721-kbd.conf"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
