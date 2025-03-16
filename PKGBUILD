# Maintaner Kernel-Dirichlet <elliottdev93@gmail.com>
pkgname=smartswap
pkgver=r1.0.0
pkgrel=1
pkgdesc="Dynamic global swappiness auto-adjuster for Arch servers with flexible system configuration"
arch=('x86_64')
url="https://github.com/Kernel-Dirichlet/smartswap"
license=('MIT')
depends=('python')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "smartswap_daemon.sh"
        "setup.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    # Create directories
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/local/bin"
    install -dm755 "$pkgdir/etc/systemd/system"
    
    # Install scripts directly from the flattened directory
    install -Dm755 "$srcdir/smartswap_daemon.sh" "$pkgdir/usr/local/bin/smartswap_daemon.sh"
    install -Dm755 "$srcdir/setup.sh" "$pkgdir/usr/bin/smartswap-setup"
    
    # Install files from the tarball
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 smartswap.service "$pkgdir/etc/systemd/system/smartswap.service"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
