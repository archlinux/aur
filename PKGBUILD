# Maintainer: jinzhongjia <mail@nviemr.org>

pkgname=deepseek-tui-bin
_pkgname=deepseek-tui
pkgver=0.8.42
pkgrel=1
# Upstream renamed DeepSeek-TUI → CodeWhale on 2026-05-24. In 0.8.x the
# `deepseek` / `deepseek-tui` binaries became thin stubs that exec the
# real codewhale binaries from PATH; the stubs print a deprecation warning
# and will be removed in v0.9.0. We ship both: codewhale-* as the real
# binaries, and the deepseek-* stubs so the deprecation message still
# fires for users invoking the old name.
pkgdesc="CodeWhale (formerly DeepSeek-TUI) - DeepSeek-first agentic terminal for open-source coding models"
arch=('x86_64' 'aarch64')
url="https://github.com/Hmbown/CodeWhale"
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus')
provides=('deepseek-tui' 'deepseek' 'codewhale' 'codewhale-tui')
conflicts=('deepseek-tui' 'deepseek' 'codewhale' 'codewhale-tui')
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
    '4e65a40f0ed35b14d90af40f1a59e1b1840eaa730e6415fd847fd2b7969cfb16'
    'd8270097b58722342c70bebcdad11782f1c8b7d69eefa259c9693c41ec408a49'
    'bd257740fb091add703e7c9459fc791d0bd5d53738f4accbc5c571c4c1d0f386'
    'b27f586cc7a58f149a7dfdc44ad3cc225e7b32d0c2bf7ad9d172c624f0784198'
)
sha256sums_aarch64=(
    'a32305f558fa34ebd65c212098c6f56a977c14d3bb32ae6e243b71c42cd81471'
    '9ce4e1c33f20d104042544a69ab9f59c39fd66b274b1160c36d0027daf67a459'
    '07f3e7ea4bae449084a8436cd0d2a393f2cd84627c809a5d376f1c9533f14b74'
    'ba72488171a47c20fbc0d68fb43d611e8e2e064488686c2494d0745e00f73132'
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
