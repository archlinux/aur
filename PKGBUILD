# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='histui-bin'
pkgver=0.0.6
pkgrel=1
pkgdesc='Notification history browser and daemon for Linux desktops (prebuilt binaries)'
url='https://github.com/jmylchreest/histui'
arch=('aarch64' 'x86_64')
license=('MIT')
depends=('gtk4' 'libadwaita' 'alsa-lib')
provides=('histui' 'histuid')
conflicts=('histui')

_github_url="https://github.com/jmylchreest/histui"

# Common sources (systemd units, license, example config)
source=(
    "histuid.service::${_github_url}/releases/download/v${pkgver}/histuid.service"
    "histuid-monitor.service::${_github_url}/releases/download/v${pkgver}/histuid-monitor.service"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jmylchreest/histui/v${pkgver}/LICENSE"
    "histuid.toml.example::https://raw.githubusercontent.com/jmylchreest/histui/v${pkgver}/docs/static/examples/histuid.toml"
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

sha256sums=('8ff243f94c8ce063629e32cee0d83eed31046dcf6470edb040276cba7d53c501' 'c1e549369c37b9f8423c02e25a12946a455c953b19615b8f000f221728975429' '5c226038c1c603adb4bc657ab8b47050d1db63a4da171b610f76f3a18fe31d2c' 'a02c73424e6c3a215163a7c1407b2cf384770c0c9fbfa5d6f17992ebb862a20a')
sha256sums_x86_64=('845a9b38b982928ded05b94fca212f6fb35b4f8eb4a59a00402a1698058d5538' 'ff91cb8f1775e6fe78ea998ba08e8452e732c87f5b6f9a03f61508196650398f')
sha256sums_aarch64=('b91a2fdba4eb9a10486de7c7b4f8140412cf2552c0af2e09c62dc90203bab5b0' 'c2abe60e463a535ab84980ac17d53d30d8ae9b545a27b95da058996b011e3631')

package() {
    install -Dm755 "histui-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/histui"
    install -Dm755 "histuid-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/histuid"
    install -Dm644 "histuid.service" "${pkgdir}/usr/lib/systemd/user/histuid.service"
    install -Dm644 "histuid-monitor.service" "${pkgdir}/usr/lib/systemd/user/histuid-monitor.service"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "histuid.toml.example" "${pkgdir}/usr/share/doc/${pkgname%-bin}/histuid.toml.example"
}
