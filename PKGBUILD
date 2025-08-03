# Maintainer: Alexander Belov markelofaleksei@gmail.com
pkgname=limine-booster
pkgver=2.1.0
pkgrel=1
pkgdesc="Automates Limine bootloader entries for kernels using Booster"
arch=('any')
url="https://github.com/abshka/limine-booster"
license=('GPL3')
depends=('booster' 'limine')
optdepends=('intel-ucode: For automatic detection and inclusion of Intel microcode'
            'amd-ucode: For automatic detection and inclusion of AMD microcode')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c966fe90fb07ae98909695125f788a904628061d53f1259dbbec607f82d4197f')

prepare() {
    cd "$pkgname-$pkgver"
    chmod +x limine-booster-update
}

package() {
    cd "$pkgname-$pkgver"

    # Install the main script
    install -Dm755 "limine-booster-update" "$pkgdir/usr/bin/limine-booster-update"

    # Install the default configuration file
    install -Dm644 "limine-booster.conf" "$pkgdir/etc/default/limine-booster.conf"

    # Install the pacman hook
    install -Dm644 "91-limine-booster.hook" "$pkgdir/usr/share/libalpm/hooks/91-limine-booster.hook"
}

# vim: set ts=4 sw=4 et:
