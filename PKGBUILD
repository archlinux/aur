# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='histui-bin'
pkgver=0.0.14
pkgrel=1
pkgdesc='Notification history browser and daemon for Linux desktops (prebuilt binaries)'
url='https://github.com/jmylchreest/histui'
arch=('aarch64' 'x86_64')
license=('MIT')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'alsa-lib')
provides=('histui' 'histuid')
conflicts=('histui')

_github_url="https://github.com/jmylchreest/histui"

# Common sources (systemd units, license, example config, shell completions)
# Local filenames are versioned so cached copies from previous releases
# are never reused when the upstream file changes between versions.
source=(
    "histuid-${pkgver}.service::${_github_url}/releases/download/v${pkgver}/histuid.service"
    "histuid-monitor-${pkgver}.service::${_github_url}/releases/download/v${pkgver}/histuid-monitor.service"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jmylchreest/histui/v${pkgver}/LICENSE"
    "histuid-${pkgver}.toml.example::https://raw.githubusercontent.com/jmylchreest/histui/v${pkgver}/docs/static/examples/histuid.toml"
    "histui-${pkgver}.bash::${_github_url}/releases/download/v${pkgver}/histui.bash"
    "_histui-${pkgver}::${_github_url}/releases/download/v${pkgver}/_histui"
    "histui-${pkgver}.fish::${_github_url}/releases/download/v${pkgver}/histui.fish"
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

sha256sums=(
    '8ff243f94c8ce063629e32cee0d83eed31046dcf6470edb040276cba7d53c501'
    'c1e549369c37b9f8423c02e25a12946a455c953b19615b8f000f221728975429'
    '5c226038c1c603adb4bc657ab8b47050d1db63a4da171b610f76f3a18fe31d2c'
    '56642452cf434bede65447968bff53fb1005b0969560299bad2b6192c414c820'
    '0be831b50e2c95d2f591cfbaa43c30e8fd8614d91f75ab5847cb8907a47a521b'
    '171f643947233618ebc4f6ee32be825a5a4a20733c324d599332cdc893cf3f55'
    '45d87142a48213ce765dd5430d5b524db0c16fe7c24fe5f2838faf170a67bf57'
)
sha256sums_x86_64=('41d5b266d878cc06b8c034d0a0c6ed138666d81ddc6c591387a30d9a7e0661a1' '0db0c4ac2b3f7bad21809948356789fb35d7bae3c75f3cb3ae8f285b95e7adb5')
sha256sums_aarch64=('6d2b5d3035abb8e26d0e8bb73be6b2cf4bf3483163df4a9f212ffd5ae61e57e9' '05911ca38d6be9d8196c352a82da8b66b02cff3507501acf8104394014f5de71')

package() {
    install -Dm755 "histui-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/histui"
    install -Dm755 "histuid-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/histuid"
    install -Dm644 "histuid-${pkgver}.service" "${pkgdir}/usr/lib/systemd/user/histuid.service"
    install -Dm644 "histuid-monitor-${pkgver}.service" "${pkgdir}/usr/lib/systemd/user/histuid-monitor.service"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "histuid-${pkgver}.toml.example" "${pkgdir}/usr/share/doc/${pkgname%-bin}/histuid.toml.example"

    # Shell completions
    install -Dm644 "histui-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/histui"
    install -Dm644 "_histui-${pkgver}" "${pkgdir}/usr/share/zsh/site-functions/_histui"
    install -Dm644 "histui-${pkgver}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/histui.fish"
}
