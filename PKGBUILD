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
md5sums=('SKIP'  # mbpfan.conf
         'SKIP'  # disable-wakeup.service
         'SKIP'  # wifi_backend.conf
         'SKIP') # .install file
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

