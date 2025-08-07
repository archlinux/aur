# Maintainer: Y0LRIN <your-email@example.com>
pkgname=gback
pkgver=1.0.0
pkgrel=1
pkgdesc="Comprehensive backup utility with Wake-on-LAN, encryption, and scheduling support"
arch=('any')
url="https://github.com/Y0LRIN/gback"
license=('GPL3')
depends=('bash' 'rsync' 'openssh' 'coreutils')
optdepends=('jq: for JSON configuration parsing (recommended)'
            'gnupg: for encryption support'
            'wakeonlan: for Wake-on-LAN functionality'
            'etherwake: alternative Wake-on-LAN tool'
            'python: fallback for JSON parsing')
backup=('etc/gback/gback.config.json')
install=gback.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ad696399ffc12aa9f81769501e52a5a22c7465242c44e50d171acd44dbaff879')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install the main script
    install -Dm755 gback.sh "$pkgdir/usr/bin/gback"
    
    # Install configuration file
    install -Dm644 example.config.json "$pkgdir/etc/gback/gback.config.json"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Create directories for user data
    install -dm755 "$pkgdir/var/lib/gback"
    install -dm755 "$pkgdir/var/log/gback"
}
