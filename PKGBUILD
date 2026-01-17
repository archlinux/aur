# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='histui-bin'
pkgver=0.0.8
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
sha256sums_x86_64=('62b08f3524523ca33b828b3ed34782b49ccad8c76036a5f46bb9052fd0967d06' '0e7a5916dd12ae3d91a2d92dd13523771faf8b0e308a9609dc5eec6f14131b01')
sha256sums_aarch64=('de58605f131d927f86dc62eaa1936fe49beff7849166ad682e53e9f85e09bd3d' 'cc6fac78e990d45d6a75f597f38dc2d27ed6d25e28b0c19ac096a7ee1c91be13')

package() {
    install -Dm755 "histui-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/histui"
    install -Dm755 "histuid-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/histuid"
    install -Dm644 "histuid.service" "${pkgdir}/usr/lib/systemd/user/histuid.service"
    install -Dm644 "histuid-monitor.service" "${pkgdir}/usr/lib/systemd/user/histuid-monitor.service"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "histuid.toml.example" "${pkgdir}/usr/share/doc/${pkgname%-bin}/histuid.toml.example"
}
