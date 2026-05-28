# Maintainer: thefangeddeity
pkgname=ele-messenger
pkgver=1.2.4
pkgrel=1
pkgdesc="Resilience-first household chat platform. Degrades gracefully from LAN to BLE when infrastructure fails."
arch=('any')
url="https://github.com/thefangeddeity/ele-messenger"
license=('GPL3')
install=ele-messenger.install
depends=('python' 'python-fastapi' 'uvicorn' 'python-websockets' 'python-aiosqlite' 'nginx')
optdepends=('tailscale: for Tailscale transport layer')
backup=('usr/lib/ele-messenger/config.json')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/ele-messenger/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a88946c1dee57d0d151997b2208a5bbbc07df4e10ad225e68d0281e66272f49f')
package() {
    cd "$srcdir/ele-messenger-$pkgver/pkg"
    cp -r usr "$pkgdir/"
    cp -r var "$pkgdir/"
    cp -r etc "$pkgdir/"
    chmod 644 "$pkgdir/etc/systemd/system/ele-messenger.service"
    chmod 644 "$pkgdir/etc/nginx/sites-available/ele-messenger"
}
