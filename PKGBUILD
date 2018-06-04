# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=networkd-dispatcher
pkgver=1.7
pkgrel=3
pkgdesc="A dispatcher daemon for systemd-networkd events"
arch=('any')
url="https://gitlab.com/craftyguy/networkd-dispatcher"
license=('GPL3')
depends=('python' 'python-dbus' 'python-gobject' 'dbus-glib')
optdepends=('wireless_tools: for interacting with wlan interfaces', 'iw: for interacting with wlan interfaces')
provides=("${pkgname}")
conflicts=("${pkgname}")
backup=('etc/conf.d/networkd-dispatcher.conf')
source=("https://gitlab.com/craftyguy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('4381ce8357e4edf8c603ec036c3fe2553f844192d85863cc8191e5c3b9c425ea70d80468abeb4a09bad5ad2630e6791efcc41e8e213ff77cab60a128e2bf145d')

package() {
        cd "$pkgname-$pkgver"
        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/etc/conf.d"
        install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -m644 -D "$srcdir/$pkgname-$pkgver/networkd-dispatcher.service" "${pkgdir}/usr/lib/systemd/system/networkd-dispatcher.service"
        install -m644 -D "$srcdir/$pkgname-$pkgver/networkd-dispatcher.conf" "${pkgdir}/etc/conf.d/networkd-dispatcher.conf"
        mkdir -p "$pkgdir/etc/networkd-dispatcher/"{off.d,routable.d,dormant.d,no-carrier.d}
}
