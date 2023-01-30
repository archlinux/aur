# Maintainer: Clayton Craft <clayton@craftyguy.net>
# Maintainer: Primalmotion <primalmotion@pm.me>
pkgname=networkd-dispatcher
pkgver=2.2.4
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
sha512sums=('6eb8a3d2d2c4b1c57b10e6b7539744c6747e5a0e3680937190d3a802fab55c491a3560727a7f84354be71dc8bf50a7432deaa624a0bdd6671ebc9cd655f1e564')

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
