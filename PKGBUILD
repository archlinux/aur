# Maintainer: Clayton Craft <clayton@craftyguy.net>
# Maintainer: Primalmotion <primalmotion@pm.me>
pkgname=networkd-dispatcher
pkgver=2.2.2
pkgrel=0
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
sha512sums=('8a975648af24e79311fb9cf1a356338e8daea103b8be896c731c390c4abe073bc4a2cfd8e5e547b64ce2c286af7609bea822607006d98e358c7da9417d06f479')

package() {
        cd "${pkgname}-${pkgver}"
        mkdir -p "${pkgdir}/usr/bin"
        mkdir -p "${pkgdir}/etc/conf.d"
        install -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
        install -m644 -D "${srcdir}/${pkgname}-${pkgver}/networkd-dispatcher.service" "${pkgdir}/usr/lib/systemd/system/networkd-dispatcher.service"
        install -m644 -D "${srcdir}/${pkgname}-${pkgver}/networkd-dispatcher.conf" "${pkgdir}/etc/conf.d/networkd-dispatcher.conf"
        mkdir -p "${pkgdir}/etc/networkd-dispatcher/"{off.d,routable.d,dormant.d,no-carrier.d,carrier.d,degraded.d,configured.d,configuring.d}
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
        # Build manpage
        make
        install -Dm644 networkd-dispatcher.8 "${pkgdir}/usr/share/man/man8/networkd-dispatcher.8"

}
