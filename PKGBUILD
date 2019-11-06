# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=networkd-dispatcher
pkgver=2.0.1
pkgrel=1
pkgdesc="A dispatcher daemon for systemd-networkd events"
arch=('any')
url="https://gitlab.com/craftyguy/networkd-dispatcher"
license=('GPL3')
makedepends=('asciidoc')
depends=('python' 'python-dbus' 'python-gobject' 'dbus-glib')
optdepends=('wireless_tools: for interacting with wlan interfaces', 'iw: for interacting with wlan interfaces')
provides=("${pkgname}")
conflicts=("${pkgname}")
backup=('etc/conf.d/networkd-dispatcher.conf')
source=("https://gitlab.com/craftyguy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('089dc5829ae0c290323933487c4f67dee748cf05a97b4b62c45d2e8c2ecb81205d82522b08344e1fb4495a5c523ad1a4927b056d6da62526e2c433907b4cba0e')

package() {
        cd "${pkgname}-${pkgver}"
        mkdir -p "${pkgdir}/usr/bin"
        mkdir -p "${pkgdir}/etc/conf.d"
        install -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
        install -m644 -D "${srcdir}/${pkgname}-${pkgver}/networkd-dispatcher.service" "${pkgdir}/usr/lib/systemd/system/networkd-dispatcher.service"
        install -m644 -D "${srcdir}/${pkgname}-${pkgver}/networkd-dispatcher.conf" "${pkgdir}/etc/conf.d/networkd-dispatcher.conf"
        mkdir -p "${pkgdir}/etc/networkd-dispatcher/"{off.d,routable.d,dormant.d,no-carrier.d,carrier.d,degraded.d}
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
        # Build manpage
        make
        install -Dm644 networkd-dispatcher.8 "${pkgdir}/usr/share/man/man8/networkd-dispatcher.8"

}
