# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>
pkgname=quickdashboard
pkgver=0.0.4
pkgrel=1
pkgdesc="Configurable Quickshell dashboard for Wayland"
arch=('any')
url="https://github.com/chpock/quickdashboard"
license=('GPL-3.0-or-later')
depends=(
    'bash'
    'quickshell'
    'qt6-graphs'
    'dgop'
    'iproute2'
    'iputils'
)
optdepends=(
    'iw: Wi-Fi SSID and signal strength in the network widget'
    'khal: calendar events widget'
    'vdirsyncer: calendar sync and refresh integration'
    'openusage-cli: AI usage limits widget'
)
provides=("$pkgname=$pkgver")
conflicts=('quickdashboard-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chpock/quickdashboard/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('565843bd34f07189bf4517d234fad79102e8bbf63e90f5d7962ed48691eacc12')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    sed -i "s/^VERSION=.*/VERSION=$pkgver/" "bin/quickdashboard"

    install -Dm755 "bin/quickdashboard" "$pkgdir/usr/bin/quickdashboard"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "$pkgdir/usr/share/$pkgname"
    cp -a \
        "shell.qml" \
        "DashboardDefault.qml" \
        "defaults.json" \
        "theme.json" \
        "widget.json" \
        "qd" \
        "$pkgdir/usr/share/$pkgname/"
}
