# Maintainer: onyxdigitaldev <dev@onyxdigital.dev>
pkgname=tp-fanctl
pkgver=1.0.0
pkgrel=1
pkgdesc='Adaptive fan controller for ThinkPad laptops — auto-switches quiet/gaming profiles based on CPU load'
arch=('any')
url='https://github.com/onyxdigitaldev/tp-fanctl'
license=('MIT')
depends=('python>=3.10' 'thinkfan')
optdepends=(
    'python-gobject: system tray applet'
    'libappindicator-gtk3: system tray applet'
)
backup=(
    'etc/thinkfan.yaml'
    'etc/thinkfan-gaming.yaml'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('11873199353c29ba906b6fdfc70f896a3baf872b0c7294518531113387cefd39')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 bin/tp-fanctl "$pkgdir/usr/bin/tp-fanctl"
    install -Dm755 bin/tp-fanctl-tray "$pkgdir/usr/bin/tp-fanctl-tray"
    install -Dm755 bin/tp-fanctl-gaming "$pkgdir/usr/bin/tp-fanctl-gaming"
    install -Dm755 bin/tp-fanctl-quiet "$pkgdir/usr/bin/tp-fanctl-quiet"
    install -Dm644 config/thinkfan-quiet.yaml "$pkgdir/etc/thinkfan.yaml"
    install -Dm644 config/thinkfan-gaming.yaml "$pkgdir/etc/thinkfan-gaming.yaml"
    install -Dm644 systemd/tp-fanctl.service "$pkgdir/usr/lib/systemd/system/tp-fanctl.service"
    install -Dm644 systemd/tp-fanctl-tray.desktop "$pkgdir/etc/xdg/autostart/tp-fanctl-tray.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
