# Maintainer: Chamal1120 <kenway213beep@gmail.com>

pkgname=macbook-12-1-linux-fixes
pkgver=1.1
pkgrel=1
pkgdesc="Custom fixes for MacBook 12,1 (2015 Pro 13 inch)"
arch=('any')
url="https://github.com/Chamal1120/macbookpro-12-1-linux-fix-files"
license=('MIT')
depends=('networkmanager' 'mbpfan')
source=('mbpfan.conf'
        'disable-wakeup.service'
        'wifi_backend.conf'
        "$pkgname.install")
md5sums=('c24e63efb6d1badfcc58bdf1ec50bacd'
         'f75d5e136021310f88eb368b3025e761'
         '77c4b38beda1c88ab18b22c4b234ac15'
         '687ef180f3abc4e7bc22efb8b0f966a2')
backup=('etc/mbpfan.conf')

package() {
    # Install NetworkManager configuration
    install -Dm644 "$srcdir/wifi_backend.conf" \
        "$pkgdir/etc/NetworkManager/conf.d/wifi_backend.conf"

    # Install mbpfan configuration
    install -Dm644 "$srcdir/mbpfan.conf" \
        "$pkgdir/etc/mbpfan.conf"

    # Install and register the systemd unit
    install -Dm644 "$srcdir/disable-wakeup.service" \
        "$pkgdir/usr/lib/systemd/system/disable-wakeup.service"

    # Post-install message to the user
    echo "Installation complete! Follow the post-installation instructions."
}

# Point to the .install script
install="macbook-12-1-linux-fixes.install"

