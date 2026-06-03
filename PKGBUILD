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
sha256sums=('4a60f6a83373ce89fe9affb06dfe6667b6165f46c6fc05ad2414ea192d6c35e1'
            'SKIP')
package() {
    cd "$srcdir/ele-messenger-$pkgver/pkg"
    cp -r usr "$pkgdir/"
    cp -r var "$pkgdir/"
    cp -r etc "$pkgdir/"
    chmod 644 "$pkgdir/etc/systemd/system/ele-messenger.service"
    chmod 644 "$pkgdir/etc/nginx/sites-available/ele-messenger"
}
