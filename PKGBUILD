# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale-bin
pkgver=0.8.52
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
sha256sums_x86_64=('13aeb0ef0d63288a09971363607660d22c512533111485e84c5a8a8f68e57a7e'
                   '382a9f3486fed088e1a85b396f6e5fdd7114acb0eec47e411ce3ab1087aa3585'
                   '1f6ee66155c0fb9a51e0b9e3a4777426489e22bf9dc9726918b2145685b01e4c'
                   'a586e72b49d74e209132b78a5c3250063fe13beb61984139d3dc92a484191932')
sha256sums_aarch64=('98930829de35b68251dd2e0e81cd352fc54e454486282a0f06d715204e905f64'
                    '69d2fe5f363ec1234802c393e31cd575f5e34e3b8b62171bfc5ca772a1add0d9'
                    '897f9cc748a1d32c14fb6afd9cd18330a1a85a3da9d8d67521e1c773899e895d'
                    '1b805ea775aa9b6318a3a7903204fb4f2ce7e5fd0c452c79f404cd86d361e35c')

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
