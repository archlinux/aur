# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale-bin
pkgver=0.8.62
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
sha256sums_x86_64=('722dcca24196a320effc5d12cabdd51fe1966aaf5436a4d0b3464ecabb885761'
                   '9b0c28d19c0fc1c23a27f444f65f1f20f4e64bcf8dc75de27bb3faf6c61765f4')
sha256sums_aarch64=('46e301c0d9837983acc463580ba15f7c90988d8bbdf1a5812f1cb1f301187c0a'
                    'd4043313ffeb5267639237faaca8b986aa90a8fbca4f30a039468101de8ca5f4')

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
