# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale-bin
pkgver=0.8.50
pkgrel=1
# Upstream renamed DeepSeek-TUI → CodeWhale on 2026-05-24. The `deepseek`
# and `deepseek-tui` binaries became thin stubs that exec the real
# codewhale binaries from PATH; the stubs print a deprecation warning and
# will be removed in v0.9.0. We ship both: codewhale-* as the real
# binaries, and the deepseek-* stubs so the deprecation message still
# fires for users invoking the old name.
# This package replaces deepseek-tui-bin.
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
sha256sums_x86_64=('d6f91a95e1710b2003cccdc61f2e861c39ba831d5828c2bbd707eeac51408485'
                   '1638f550ff610ad693aeb68d06a317776b87d5282874ceb3b8ca162dce47056b'
                   '271d7144e9a4f916be997c43e816df3adff152dfdf8ceb412fe0fcf147f69667'
                   'ee126ffb42a8ca5e982028ca9ee59076c595ae0c616f0b28833f397616b7b1a4')
sha256sums_aarch64=('6abf21de137a13c363d7d9d5bf3264708a4370f30189e60ae67b50e587143aae'
                    'ce091b72e3d483d3079fb95a9b9f003c94551880eecfaff0e859892b30e691a5'
                    'edda1cea2f9f740a0c2bc941d70c601630a5a54d4ed9397d544d808a8edfe550'
                    'e991a5867cf53c875244e9485b138ce3f282851cdda3185992162e54fcc044cf')

source_x86_64=(
    "codewhale-${pkgver}-x86_64::${_relurl}/codewhale-linux-x64"
    "codewhale-tui-${pkgver}-x86_64::${_relurl}/codewhale-tui-linux-x64"
    "deepseek-${pkgver}-x86_64::${_relurl}/deepseek-linux-x64"
    "deepseek-tui-${pkgver}-x86_64::${_relurl}/deepseek-tui-linux-x64"
)
source_aarch64=(
    "codewhale-${pkgver}-aarch64::${_relurl}/codewhale-linux-arm64"
    "codewhale-tui-${pkgver}-aarch64::${_relurl}/codewhale-tui-linux-arm64"
    "deepseek-${pkgver}-aarch64::${_relurl}/deepseek-linux-arm64"
    "deepseek-tui-${pkgver}-aarch64::${_relurl}/deepseek-tui-linux-arm64"
)


package() {
    install -Dm755 "${srcdir}/codewhale-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/codewhale"
    install -Dm755 "${srcdir}/codewhale-tui-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/codewhale-tui"
    # Legacy stubs: print a deprecation warning and exec codewhale from PATH.
    # Removed by upstream in v0.9.0; drop these install lines at that point.
    install -Dm755 "${srcdir}/deepseek-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/deepseek"
    install -Dm755 "${srcdir}/deepseek-tui-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/deepseek-tui"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
