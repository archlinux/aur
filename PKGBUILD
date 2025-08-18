# Maintainer: Chamal1120 <kenway213beep@gmail.com>

pkgname=macbook-12-1-linux-fixes
pkgver=1.2
pkgrel=2
pkgdesc="Custom fixes for MacBook 12,1 (2015 Pro 13 inch)"
arch=('any')
url="https://github.com/Chamal1120/macbookpro-12-1-linux-fix-files"
license=('MIT')
depends=('networkmanager' 'macfand-git' 'tlp' 'iwd')
source=("git+https://github.com/Chamal1120/macbookpro-12-1-linux-fix-files.git::configs/macfand.conf"
        "git+https://github.com/Chamal1120/macbookpro-12-1-linux-fix-files.git::configs/wifi_backend.conf"
        "git+https://github.com/Chamal1120/macbookpro-12-1-linux-fix-files.git::configs/tlp.conf"
        "git+https://github.com/Chamal1120/macbookpro-12-1-linux-fix-files.git::init_services/disable-wakeup.service"
        "$pkgname.install")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
backup=('etc/macfand.conf' 
        'etc/tlp.conf'
        'etc/wifi_backend.conf'
        '/usr/lib/systemd/system/disable-wakeup.service')

package() {
    # Install NetworkManager configuration
    install -Dm644 "$srcdir/wifi_backend.conf" \
        "$pkgdir/etc/NetworkManager/conf.d/wifi_backend.conf"

    # Install macfand configuration
    install -Dm644 "$srcdir/macfand.conf" \
        "$pkgdir/etc/macfand.conf"

    # Install tlp configuration
    install -Dm644 "$srcdir/tlp.conf" \
        "$pkgdir/etc/tlp.conf"

    # Install and register the systemd unit
    install -Dm644 "$srcdir/disable-wakeup.service" \
        "$pkgdir/usr/lib/systemd/system/disable-wakeup.service"

    # Post-install message to the user
    echo "Installation complete! Follow the post-installation instructions."
}

# Point to the .install script
install="macbook-12-1-linux-fixes.install"
