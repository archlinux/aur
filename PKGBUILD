# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale-bin
pkgver=0.8.66
pkgrel=1
# Upstream renamed DeepSeek-TUI → CodeWhale on 2026-05-24 and removed the
# legacy `deepseek`/`deepseek-tui` stub binaries in v0.8.54.
# This package replaces deepseek-tui-bin; `provides` keeps the old names
# satisfied so users with `deepseek` / `deepseek-tui` in dep lists migrate
# cleanly to codewhale-* binaries.
pkgdesc="CodeWhale (formerly DeepSeek-TUI) - DeepSeek-first agentic terminal for open-source coding models"
arch=('x86_64' 'aarch64')
url="https://github.com/Hmbown/CodeWhale"
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus')
provides=('codewhale' 'codewhale-tui' 'deepseek' 'deepseek-tui')
conflicts=('codewhale' 'codewhale-tui' 'deepseek' 'deepseek-tui' 'deepseek-tui-bin')
replaces=('deepseek-tui-bin')
options=(!strip)

_relurl="https://github.com/Hmbown/CodeWhale/releases/download/v${pkgver}"

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Hmbown/CodeWhale/v${pkgver}/LICENSE")
sha256sums=('91873e17f073f4dcddc63799a0a6fdeb44a281440b6c5e0b9d8ea2aa7f7ffd95')
sha256sums_x86_64=('f787f68f55f5e4474e47dfa8d4725f71f03f5fbc117548d597003d045982f91f'
                   'd02a0753ff4f8a7ed4ae19b2c45235d91f372af3e1ea7a6d5bc29cba5b318a8d')
sha256sums_aarch64=('7f1c82ee4509cd0db1cacaa93fda45e9b4b3e8bfb992bbba32c543f08edf4bb4'
                    '1c9b2dda13af89e23b40a9f1735ec3e1caa31b8a5698892a81dddbc5b5893d46')

source_x86_64=(
    "codewhale-${pkgver}-x86_64::${_relurl}/codewhale-linux-x64"
    "codewhale-tui-${pkgver}-x86_64::${_relurl}/codewhale-tui-linux-x64"
)
source_aarch64=(
    "codewhale-${pkgver}-aarch64::${_relurl}/codewhale-linux-arm64"
    "codewhale-tui-${pkgver}-aarch64::${_relurl}/codewhale-tui-linux-arm64"
)


package() {
    install -Dm755 "${srcdir}/codewhale-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/codewhale"
    install -Dm755 "${srcdir}/codewhale-tui-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/codewhale-tui"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
