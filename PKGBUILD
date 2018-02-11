# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=networkd-dispatcher
pkgver=1.7
pkgrel=1
pkgdesc="A dispatcher daemon for systemd-networkd events"
arch=('any')
url="https://github.com/craftyguy/networkd-dispatcher"
license=('GPL3')
depends=('python' 'python-dbus' 'python-gobject' 'dbus-glib')
optdepends=('wireless_tools: for interacting with wlan interfaces', 'iw: for interacting with wlan interfaces')
provides=("${pkgname}")
conflicts=("${pkgname}")
backup=('etc/conf.d/networkd-dispatcher.conf')
source=("https://github.com/craftyguy/networkd-dispatcher/archive/${pkgver}.tar.gz")
sha512sums=('cbd3a747dcaa3c94dda61c42219f9768394c7c4591cbc4c6bc4b7ad385eb2e0e9cde65f1928c92814208540ddd271441bea8d618862ba514728bae592797fb6c')

package() {
        cd "$pkgname-$pkgver"
        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/etc/conf.d"
        install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -m644 -D "$srcdir/$pkgname-$pkgver/networkd-dispatcher.service" "${pkgdir}/usr/lib/systemd/system/networkd-dispatcher.service"
        install -m644 -D "$srcdir/$pkgname-$pkgver/networkd-dispatcher.conf" "${pkgdir}/etc/conf.d/networkd-dispatcher.conf"
        mkdir -p "$pkgdir/etc/networkd-dispatcher/"{off.d,routable.d,dormant.d,no-carrier.d}
}
