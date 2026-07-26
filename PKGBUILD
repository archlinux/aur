# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=gajae-code-bin
_pkgname=gajae-code
pkgver=0.11.11
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
            '8ebe3221610610c7f5a5d0ce72f878e6aa8a4cee6c1a0a849b58314bb0a3d238')
sha256sums_x86_64=('504e30f5225a2575dc59a0af0ad73866ef3ec43fba7bf865e58bae01b7180e50')
sha256sums_aarch64=('3b818814f82503d62ef0346038e8ade0b244d3da0099918a3a3d57174d0f86d3')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/gjc"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-NOTICE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.md"
}
