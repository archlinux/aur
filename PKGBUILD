# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='histui-bin'
pkgver=0.0.2
pkgrel=1
pkgdesc='Notification history browser and daemon for Linux desktops (prebuilt binaries)'
url='https://github.com/jmylchreest/histui'
arch=('aarch64' 'x86_64')
license=('MIT')
depends=('gtk4' 'libadwaita' 'alsa-lib')
provides=('histui' 'histuid')
conflicts=('histui')

_github_url="https://github.com/jmylchreest/histui"

# Common sources (systemd units, license)
source=(
    "histuid.service::${_github_url}/releases/download/v${pkgver}/histuid.service"
    "histuid-monitor.service::${_github_url}/releases/download/v${pkgver}/histuid-monitor.service"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jmylchreest/histui/v${pkgver}/LICENSE"
)

# Architecture-specific binary sources
source_x86_64=(
    "histui-${pkgver}-x86_64::${_github_url}/releases/download/v${pkgver}/histui-linux-amd64"
    "histuid-${pkgver}-x86_64::${_github_url}/releases/download/v${pkgver}/histuid-linux-amd64"
)
source_aarch64=(
    "histui-${pkgver}-aarch64::${_github_url}/releases/download/v${pkgver}/histui-linux-arm64"
    "histuid-${pkgver}-aarch64::${_github_url}/releases/download/v${pkgver}/histuid-linux-arm64"
)

sha256sums=('8ff243f94c8ce063629e32cee0d83eed31046dcf6470edb040276cba7d53c501' 'c1e549369c37b9f8423c02e25a12946a455c953b19615b8f000f221728975429' '5c226038c1c603adb4bc657ab8b47050d1db63a4da171b610f76f3a18fe31d2c')
sha256sums_x86_64=('973884da15e301c9f86327db51eeb673f77824dc8a3309c37d9db47839d13add' 'de30e7d0d70cd8d3f3a3777aac61cbce697169ca9c138121e2d5c13abc7bbe6d')
sha256sums_aarch64=('f5e43ea6acda8498c3b7cbf4f125fadf5b55e375fed33b04c64117b4c9191dbc' '24d7cd10d89e0fec338d78bcfc335585b9d020a39d961ccdaefff1edbad73936')

package() {
    install -Dm755 "histui-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/histui"
    install -Dm755 "histuid-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/histuid"
    install -Dm644 "histuid.service" "${pkgdir}/usr/lib/systemd/user/histuid.service"
    install -Dm644 "histuid-monitor.service" "${pkgdir}/usr/lib/systemd/user/histuid-monitor.service"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
