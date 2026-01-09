# Maintainer: Beat <beat at example dot com>
# Contributor: Original submitter <original at example dot com>
pkgname=twitch-token-server
pkgver=1.0.0
pkgrel=1
pkgdesc="Local token server for Twitch API authentication"
arch=('any')
url="https://github.com/yourusername/twitch-token-server"
license=('MIT')
depends=('nodejs')
backup=('etc/twitch-token-server.conf')
source=("token-server.js"
        "twitch-token-server.service"
        "twitch-token-server-configure")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    # Install the server
    install -Dm644 "$srcdir/token-server.js" "$pkgdir/opt/twitch-token-server/token-server.js"
    
    # Install systemd service
    install -Dm644 "$srcdir/twitch-token-server.service" "$pkgdir/usr/lib/systemd/system/twitch-token-server.service"
    
    # Install configuration script
    install -Dm755 "$srcdir/twitch-token-server-configure" "$pkgdir/usr/bin/twitch-token-server-configure"
    
    # Create default config directory
    install -dm700 "$pkgdir/etc"
}

post_install() {
    echo ""
    echo "=== Twitch Token Server installed ==="
    echo ""
    echo "To configure and start the server, run:"
    echo "    sudo twitch-token-server-configure"
    echo ""
    echo "This will prompt you for your Twitch Client ID and Secret."
    echo ""
}

post_upgrade() {
    echo ""
    echo "=== Twitch Token Server upgraded ==="
    echo ""
    echo "If you need to reconfigure, run:"
    echo "    sudo twitch-token-server-configure"
    echo ""
    echo "Or edit /etc/twitch-token-server.conf and restart:"
    echo "    sudo systemctl restart twitch-token-server"
    echo ""
}
