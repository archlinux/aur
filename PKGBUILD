# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale-bin
pkgver=0.8.47
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

sha256sums_x86_64=(
    '8386bc5d3f63c2dd2e29b570815546fd4f84235da56b686f4afe5d058138698f'
    'c9fd8ca3ba0d517be25cf789b41152d8bdc746d884e8c81fd5c13fec4bb74f57'
    '6374819efbf9119aca100a2768a3372912b2217529faa00348577cdbd99a0003'
    '05f84b71828001988e49dfeeba5e5745cb4c662285d160cc6ed43c604b7b0049'
)
sha256sums_aarch64=(
    '9050075da0d4496b52edf237a59a21ccde8b60553cbc689e7aa5565957ebbed8'
    'a52990590d6f0426819fd3b95a6739922da7e519991278b9d62e2ab42a1745f5'
    'cb4be56e3ae7867b805fcbb5568febd640b37395cb601e017686b014ac1fb2b1'
    'd521c16bfda2af42929eac97d9bef801657bf349007f6fc2e06d462c9d0e99c1'
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
