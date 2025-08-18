# Maintainer: Chamal1120 <kenway213beep@gmail.com>

pkgname=macbook-12-1-linux-fixes
pkgver=1.2
pkgrel=2
pkgdesc="Custom fixes for MacBook 12,1 (2015 Pro 13 inch)"
arch=('any')
url="https://github.com/Chamal1120/macbookpro-12-1-linux-fix-files"
license=('MIT')
depends=('networkmanager' 'libconfig' 'tlp' 'iwd')
source=("git+https://github.com/Chamal1120/macbookpro-12-1-linux-fix-files.git")
md5sums=('SKIP')

backup=('etc/macfand.conf' 
        'etc/NetworkManager/conf.d/wifi_backend.conf'
        'usr/lib/systemd/system/disable-wakeup.service')

package() {
    cd "$srcdir/macbookpro-12-1-linux-fix-files"

    # Install NetworkManager configuration
    install -Dm644 configs/wifi_backend.conf \
        "$pkgdir/etc/NetworkManager/conf.d/wifi_backend.conf"

    # Install macfand configuration
    install -Dm644 configs/macfand.conf \
        "$pkgdir/etc/macfand.conf"

    # Install tlp configuration
    install -Dm644 configs/tlp.conf \
        "$pkgdir/etc/tlp.d/99-macbook12.conf"

    # Install and register the systemd unit
    install -Dm644 init_services/disable-wakeup.service \
        "$pkgdir/usr/lib/systemd/system/disable-wakeup.service"

    # Post-install message
    echo "Installation complete! Follow the post-installation instructions."
}

# Point to the .install script
install="macbook-12-1-linux-fixes.install"

