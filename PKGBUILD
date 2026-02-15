# Maintainer: Ellis Clayton <ellis@ellis.codes>
pkgname=ha-localizer
pkgver=0.2.0
pkgrel=1
pkgdesc="Provide timezone and geolocation information to Linux systems via Home Assistant"
arch=('x86_64' 'aarch64')
url="https://github.com/ellsclytn/ha-localizer"
license=('MIT')
depends=()
options=('!debug')
optdepends=(
    'geoclue: for ha-geoip location services'
    'systemd: for systemd service units'
    'networkd-dispatcher: for automatic timezone sync on network changes'
)
backup=('etc/ha-localizer.toml')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
source_x86_64=("${pkgname}-ha-geoip-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/ha-geoip-x86_64-unknown-linux-gnu.tar.gz"
    "${pkgname}-ha-timezone-sync-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/ha-timezone-sync-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-ha-geoip-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/ha-geoip-aarch64-unknown-linux-gnu.tar.gz"
    "${pkgname}-ha-timezone-sync-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/ha-timezone-sync-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('ec8f524c5d854a243d46637f086c229812bededb230cc6d105b1d5030745f107')
sha256sums_x86_64=('44b1dd707f86f6da4fa2b74f3d604c74ad96f516b652672e5a4f6e213278d729'
    '6fdae6a0069296b4a0ba0b8b674d417e3ea4a8bbfad6e55ca22db4b1dc2bbd39')
sha256sums_aarch64=('000e6f0e837a4c19171effee7aa77960e109b4509a56d7156c3cae2c4be96531'
    '41c457f7e050acb4ae14fb6459f71dc4b0e469cab4795986c9c726c1b68111cd')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm644 dist/config/ha-localizer.toml "${pkgdir}/etc/ha-localizer.toml"

    install -Dm644 dist/systemd/user/ha-geoip.service \
        "${pkgdir}/usr/lib/systemd/user/ha-geoip.service"
    install -Dm644 dist/systemd/system/ha-timezone-sync.service \
        "${pkgdir}/usr/lib/systemd/system/ha-timezone-sync.service"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd "${srcdir}"
    install -Dm755 ha-geoip "${pkgdir}/usr/bin/ha-geoip"
    install -Dm755 ha-timezone-sync "${pkgdir}/usr/bin/ha-timezone-sync"
}
