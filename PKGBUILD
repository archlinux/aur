# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale-bin
pkgver=0.8.53
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
sha256sums_x86_64=('57104d1f6a38884924d0fae7b991c33c40a3be6f8045747d4ff055f10aaf62dc'
                   '0c189693873840587f04a3e51b96b72a41f4653c4d420a99ec85b01f839a104c'
                   '829a4c926af47084df814e5d99fabb06e99938af8fbfb3a6601de3c8da357573'
                   '70ba8fd94d02b862335b03e577eb327e3ff1535f3528fad9a926f7370a3b6fad')
sha256sums_aarch64=('a98fdc00ebff200d3ca2e2a678409a13e5ce8b9fb0d830eadc9adc6c807391db'
                    'ddaf3321ab51b33a8c9fd9e5186067fe6cd9ecb7c489f4696ccc31ea1906054c'
                    'c6f4d2510e2fbee41be0247d458f9703088a1a64e2fb99adc530b17e1aa2b8d7'
                    '74256d81cf8da3bb76c03953dc0b7ce53119439ab5c9252f4da15d2b184d8f5a')

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
