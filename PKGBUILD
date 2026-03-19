# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='histui-bin'
pkgver=0.0.10
pkgrel=1
pkgdesc='Notification history browser and daemon for Linux desktops (prebuilt binaries)'
url='https://github.com/jmylchreest/histui'
arch=('aarch64' 'x86_64')
license=('MIT')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'alsa-lib')
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
sha256sums_x86_64=('db9becca317bc14b40e875de1f61975bddf9e16d0c9981633695733e92ab51b2' '743d30536bd15f91e7e4d728719c4a8c12c1b06f1e44319f4d28ff0ed588a904')
sha256sums_aarch64=('9627308c9a62a4378b7bf1b4e757aa3c1a6dc5c376f9b214ecfaf9bc74e60b18' '9ccaae02d2242af4300ec2499da884152089f934b89149a83a14c30cd37ba38e')

package() {
    install -Dm755 "histui-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/histui"
    install -Dm755 "histuid-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/histuid"
    install -Dm644 "histuid.service" "${pkgdir}/usr/lib/systemd/user/histuid.service"
    install -Dm644 "histuid-monitor.service" "${pkgdir}/usr/lib/systemd/user/histuid-monitor.service"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "histuid.toml.example" "${pkgdir}/usr/share/doc/${pkgname%-bin}/histuid.toml.example"
}
