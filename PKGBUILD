# Maintainer: Artem Ventvent <ваш_email@example.com>
pkgname=wireguard-tray
pkgver=1.0.1
pkgrel=1
pkgdesc="Minimal tray GUI to manage WireGuard connections on Linux"
arch=('any')
url="https://github.com/artemventvent/wireguard-tray"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'libappindicator-gtk3' 'wireguard-tools' 'libnotify')
source=("$pkgname-$pkgver.tar.gz::https://github.com/artemventvent/wireguard-tray/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aeb3197ff00b269f907e3d776c53d44bf66a2818307acd05049e7f370b9503b8')
install="wireguard-tray.install"

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Установка скрипта
    install -Dm755 tray.py "$pkgdir/usr/bin/wireguard-tray"
    
    # Установка иконок
    install -dm755 "$pkgdir/usr/share/wireguard-tray/icons"
    install -Dm644 icon-off.png "$pkgdir/usr/share/wireguard-tray/icons/icon-off.png"
    install -Dm644 icon-on.png "$pkgdir/usr/share/wireguard-tray/icons/icon-on.png"
    
    # Установка systemd service
    install -Dm644 wireguard-tray.service "$pkgdir/usr/lib/systemd/user/wireguard-tray.service"
    
    # Установка desktop файла
    install -Dm644 wireguard-tray.desktop "$pkgdir/usr/share/applications/wireguard-tray.desktop"
}