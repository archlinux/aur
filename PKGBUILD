# Maintainer: Lunar King
# All credit goes to DavidSt49 for source code
pkgname=watch-unlock-linux
pkgver=1.0.0
pkgrel=1
pkgdesc="Unlock your Linux session automatically with your Apple Watch via Bluetooth LE"
arch=('any')
url="https://github.com/DavidSt49/watch-unlock-linux"
license=('MIT')
depends=('python' 'python-cryptography' 'bluez' 'bluez-utils')
makedepends=('git')
backup=('etc/watch-unlock-linux/irk')
install=watch-unlock-linux.install
source=("${pkgname}::git+https://github.com/DavidSt49/watch-unlock-linux.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 unlock_daemon.py "$pkgdir/opt/watch-unlock-linux/unlock_daemon.py"
    install -Dm755 debug_rssi.py    "$pkgdir/opt/watch-unlock-linux/debug_rssi.py"

    install -Dm644 apple-watch-unlock.service \
        "$pkgdir/usr/lib/systemd/system/apple-watch-unlock.service"

    install -dm700 "$pkgdir/etc/watch-unlock-linux"
    install -Dm600 <(echo "YOUR_IRK_HEX") "$pkgdir/etc/watch-unlock-linux/irk"
}
