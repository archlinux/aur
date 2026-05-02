# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='histui-bin'
pkgver=0.0.11
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
sha256sums_x86_64=('3d33292eb331d3d582337b575caa398afbc546e96640afed0d4996f05d50d3f1' 'ae4fcf12681410ebcd9c81520451f279468428c5692a7709d14324b769389b63')
sha256sums_aarch64=('376c32f84624330586191c5208e646452c27ba955998e78455bad6f204d82e6f' '885fcecbf9376c1fe687d9e2d5f5d7521c56fa2127febf6a3bc1a3cd0f326eaf')

package() {
    install -Dm755 "histui-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/histui"
    install -Dm755 "histuid-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/histuid"
    install -Dm644 "histuid.service" "${pkgdir}/usr/lib/systemd/user/histuid.service"
    install -Dm644 "histuid-monitor.service" "${pkgdir}/usr/lib/systemd/user/histuid-monitor.service"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "histuid.toml.example" "${pkgdir}/usr/share/doc/${pkgname%-bin}/histuid.toml.example"
}
