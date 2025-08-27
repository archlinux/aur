# Maintainer: Alexander Belov markelofaleksei@gmail.com
pkgname=limine-booster
pkgver=2.5.0
pkgrel=1
pkgdesc="Zero-config automation for Limine boot entries with Booster and mkinitcpio support, including AUR kernels"
arch=('any')
url="https://github.com/abshka/limine-booster"
license=('GPL3')
depends=('booster' 'limine')
optdepends=('intel-ucode: For automatic detection and inclusion of Intel microcode'
            'amd-ucode: For automatic detection and inclusion of AMD microcode'
            'mkinitcpio: For generating traditionagsl initramfs images'
            'limine-snapper-sync: For BTRFS snapshot integration')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f36224fbcae8e9833913fdf3c478a5991a7d482a708bdb452bee457bb033d966')

prepare() {
    cd "$pkgname-$pkgver"
    chmod +x limine-booster-update
}

package() {
    cd "$pkgname-$pkgver"

    # Install the main script
    install -Dm755 "limine-booster-update" "$pkgdir/usr/bin/limine-booster-update"

    # Install the remove script
    install -Dm755 "limine-booster-remove" "$pkgdir/usr/bin/limine-booster-remove"

    # Install the install script
    install -Dm755 "limine-booster-install.sh" "$pkgdir/usr/share/libalpm/scripts/limine-booster-install.sh"

    # Install the default configuration file
    install -Dm644 "limine-booster.conf" "$pkgdir/etc/default/limine-booster.conf"

    # Install the pacman hook
    install -Dm644 "91-limine-booster.hook" "$pkgdir/usr/share/libalpm/hooks/91-limine-booster.hook"
}

# vim: set ts=4 sw=4 et:
