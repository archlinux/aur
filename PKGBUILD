# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=networkd-dispatcher
pkgver=2.0
pkgrel=1
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
sha512sums=('20b5477b62dacb166704d8ce432b76436826baba9d31593b3dc4960d9ba27bac839eac12d8b90cd2420dc75dd00b117f20d008d5f1879cc5fdddfd83812bf0a5')

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
