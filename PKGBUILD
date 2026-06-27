# Maintainer: Matt <matthew.panton@gmail.com>
pkgname=nexus-open
pkgver=0.3.5
pkgrel=1
pkgdesc="Linux controller for Corsair iCUE Nexus display device"
arch=('x86_64')
url="https://github.com/mantonx/nexus-open"
license=('MIT')
depends=('libayatana-appindicator' 'gtk3' 'libgl' 'libgles' 'libegl')
install=nexus-open.install
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-amd64.tar.gz")
sha256sums=('e375bea26721198450f9415689ea21adc3b5fd36aab3993f48d3d8d0707b27b5')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 nexus-open \
        "${pkgdir}/usr/bin/nexus-open"

    for plugin in plugins-dist/nexus-*; do
        install -Dm755 "$plugin" \
            "${pkgdir}/usr/lib/nexus-open/plugins/$(basename "$plugin")"
    done

    install -Dm644 packaging/udev/99-corsair-nexus.rules \
        "${pkgdir}/usr/share/nexus-open/99-corsair-nexus.rules"

    install -Dm644 packaging/systemd/nexus-open.service \
        "${pkgdir}/usr/lib/systemd/user/nexus-open.service"

    install -Dm644 packaging/desktop/nexus-open.desktop \
        "${pkgdir}/usr/share/applications/nexus-open.desktop"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
