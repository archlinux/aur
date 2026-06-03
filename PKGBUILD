# Maintainer: thefangeddeity
pkgname=ele-messenger
pkgver=1.3.5
pkgrel=1
pkgdesc="Resilience-first household chat platform. Degrades gracefully from LAN to BLE when infrastructure fails."
arch=('any')
url="https://github.com/thefangeddeity/ele-messenger"
license=('GPL3')
install=ele-messenger.install
depends=('python' 'python-fastapi' 'uvicorn' 'python-websockets' 'python-aiosqlite' 'nginx' 'avahi')
optdepends=('tailscale: for Tailscale transport layer')
backup=('usr/lib/ele-messenger/config.json')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/ele-messenger/archive/refs/tags/v$pkgver.tar.gz"
        "ele-messenger.install")
sha256sums=('cb641859d0560e2de68de0b7637e4e350127ef6f25b2c5d6e01584eb7d49abd5'
            'SKIP')
package() {
    cd "$srcdir/ele-messenger-$pkgver/pkg"
    cp -r usr "$pkgdir/"
    cp -r var "$pkgdir/"
    cp -r etc "$pkgdir/"
    chmod 644 "$pkgdir/etc/systemd/system/ele-messenger.service"
    chmod 644 "$pkgdir/etc/nginx/sites-available/ele-messenger"
}
