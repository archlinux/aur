# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=gajae-code-bin
_pkgname=gajae-code
pkgver=0.18.9
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
            '6cafdd23a28e415958177fd7948a3c27ef59ce0ff062e18c88409bebea1ccddd')
sha256sums_x86_64=('69ff890997125c150694f121292497482351df8eacca9d2623f87eacc13dc35d')
sha256sums_aarch64=('a9c85a297ad6ebd5327669b47b3bd6529f04f5ba76f5db6c146b38101197b4c8')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/gjc"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-NOTICE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.md"
}
