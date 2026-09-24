# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=gajae-code-bin
_pkgname=gajae-code
pkgver=0.17.5
pkgrel=1
pkgdesc="External coding-agent harness with deep-interview, ralplan, and ultragoal workflows (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Yeachan-Heo/gajae-code"
license=('MIT')
depends=('glibc')
optdepends=(
    'tmux: tmux-backed leader sessions and team workers'
    'git: workflow integration and worktree isolation'
)
provides=("${_pkgname}=${pkgver}" 'gjc')
conflicts=("${_pkgname}" 'gjc')
# Prebuilt Bun standalone binary: stripping ELF symbols breaks argument
# routing (gjc args fall through to the embedded Bun runtime). Keep the
# binary as shipped by upstream.
options=('!strip' '!debug' '!lto')

_base="${url}/releases/download/v${pkgver}"
_raw="https://raw.githubusercontent.com/Yeachan-Heo/gajae-code/v${pkgver}"

source=(
    "${pkgname}-${pkgver}-LICENSE::${_raw}/LICENSE"
    "${pkgname}-${pkgver}-NOTICE.md::${_raw}/NOTICE.md"
)
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_base}/gjc-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_base}/gjc-linux-arm64")

sha256sums=('a6625a82edf7b97e90ccd713c16fc6a3cee8cd8978752b638b34a488154cb0f1'
            '79b261a752cf55eae6d24caaf5ddb79baff6203540e8b8c082c5a75ae6ac83f3')
sha256sums_x86_64=('7623112345d4f315f66bdf4f4c0fcbab777fae992b9e4a81cc6bde11d653bf11')
sha256sums_aarch64=('f7561a7beeb89ada6e95b8d2ad16eab636e24f45201c49af3ff810ca80d917ac')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/gjc"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-NOTICE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.md"
}
