# Maintainer: onyxdigitaldev <dev@onyxdigital.dev>
pkgname=dell-fanctl-git
pkgver=r2.d102f75
pkgrel=1
pkgdesc='Adaptive fan controller for Dell laptops — auto-switches quiet/gaming profiles based on CPU load and temperature (git version)'
arch=('any')
url='https://github.com/onyxdigitaldev/dell-fanctl'
license=('MIT')
depends=('python>=3.10')
optdepends=(
    'python-gobject: system tray applet'
    'libappindicator-gtk3: system tray applet'
)
makedepends=('git')
provides=('dell-fanctl')
conflicts=('dell-fanctl')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 bin/dell-fanctl "$pkgdir/usr/bin/dell-fanctl"
    install -Dm755 bin/dell-fanctl-tray "$pkgdir/usr/bin/dell-fanctl-tray"
    install -Dm644 systemd/dell-fanctl.service "$pkgdir/usr/lib/systemd/system/dell-fanctl.service"
    install -Dm644 systemd/dell-fanctl-tray.desktop "$pkgdir/etc/xdg/autostart/dell-fanctl-tray.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
