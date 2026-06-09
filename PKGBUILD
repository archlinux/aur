# Maintainer: Matt <matthew.panton@gmail.com>
pkgname=nexus-open
pkgver=0.0.1
pkgrel=1
pkgdesc="Linux controller for Corsair iCUE Nexus display device"
arch=('x86_64')
url="https://github.com/mantonx/nexus-open"
license=('MIT')
depends=('libayatana-appindicator' 'gtk3' 'libgl' 'libgles' 'libegl')
install=nexus-open.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-amd64.tar.gz")
sha256sums=('3f4bb26bc0e28d1e39f92ddab7581c8cf4871b74e331bc46d11de24aab58e440')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 nexus-open \
        "${pkgdir}/usr/bin/nexus-open"

    install -Dm644 packaging/udev/99-corsair-nexus.rules \
        "${pkgdir}/usr/share/nexus-open/99-corsair-nexus.rules"

    install -Dm644 packaging/systemd/nexus-open.service \
        "${pkgdir}/usr/lib/systemd/user/nexus-open.service"

    # Preset enables the service automatically on first install.
    printf 'enable nexus-open.service\n' | \
        install -Dm644 /dev/stdin \
        "${pkgdir}/usr/lib/systemd/user-preset/75-nexus-open.preset"

    install -Dm644 packaging/desktop/nexus-open.desktop \
        "${pkgdir}/usr/share/applications/nexus-open.desktop"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
