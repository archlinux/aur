# Maintainer: Alexander Belov markelofaleksei@gmail.com
pkgname=limine-booster
pkgver=3.0.0
pkgrel=1
pkgdesc="Zero-config automation for Limine boot entries with Booster"
arch=('any')
url="https://github.com/abshka/limine-booster"
license=('GPL3')
depends=('booster' 'limine')
optdepends=('intel-ucode: For automatic detection and inclusion of Intel microcode'
            'amd-ucode: For automatic detection and inclusion of AMD microcode'
            'limine-snapper-sync: For BTRFS snapshot integration')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('2dabc7fe5e4a7fc70176a1da2cc275ebc4f21a309a539f27e22ae9e612fb8f74')

prepare() {
    cd "$pkgname-$pkgver"
    chmod +x limine-booster-update limine-booster-remove limine-booster-install.sh
    chmod +x limine-enroll-config limine-reset-enroll
}

package() {
    cd "$pkgname-$pkgver"

    # Install the main script
    install -Dm755 "limine-booster-update" "$pkgdir/usr/bin/limine-booster-update"

    # Install the remove script
    install -Dm755 "limine-booster-remove" "$pkgdir/usr/bin/limine-booster-remove"

    # Install the install script
    install -Dm755 "limine-booster-install.sh" "$pkgdir/usr/share/libalpm/scripts/limine-booster-install.sh"

    # Install Limine enrollment commands
    install -Dm755 "limine-enroll-config" "$pkgdir/usr/bin/limine-enroll-config"
    install -Dm755 "limine-reset-enroll" "$pkgdir/usr/bin/limine-reset-enroll"

    # Install the default configuration file
    install -Dm644 "limine-booster.conf" "$pkgdir/etc/default/limine-booster.conf"

    # Install the pacman hook
    install -Dm644 "91-limine-booster.hook" "$pkgdir/usr/share/libalpm/hooks/91-limine-booster.hook"
}

# vim: set ts=4 sw=4 et:
