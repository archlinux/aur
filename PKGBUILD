# Maintainer: RAprogramm <andrey.rozanov.vl@gmail.com>
pkgname=logi-mx-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Logitech MX Master 3S configuration tool and daemon with system tray (binary package)"
arch=('x86_64')
url="https://github.com/RAprogramm/logi-mx"
license=('MIT')
depends=('hidapi' 'systemd' 'gtk4' 'libadwaita' 'dbus')
provides=('logi-mx')
conflicts=('logi-mx')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RAprogramm/logi-mx/releases/download/v${pkgver}/logi-mx-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ab20306a2ecab2f22e650c0a3c5e2e96094de521492698a944b3cbc1da67e20d')

package() {
    # Install binaries
    install -Dm755 logi-mx "$pkgdir/usr/bin/logi-mx"
    install -Dm755 logi-mx-daemon "$pkgdir/usr/bin/logi-mx-daemon"
    install -Dm755 logi-mx-ui "$pkgdir/usr/bin/logi-mx-ui"

    # Install udev rules
    install -Dm644 90-logi-mx.rules "$pkgdir/usr/lib/udev/rules.d/90-logi-mx.rules"

    # Install systemd user service
    install -Dm644 logi-mx-daemon.service "$pkgdir/usr/lib/systemd/user/logi-mx-daemon.service"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
