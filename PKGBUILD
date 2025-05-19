# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-blueprint-bin
pkgver=0.10.10
pkgrel=1
pkgdesc="Go-blueprint allows users to spin up a quick Go project using a popular framework.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://docs.go-blueprint.dev/"
_ghurl="https://github.com/Melkeydev/go-blueprint"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
optdepends=(
    'zsh'
    'fish'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Melkeydev/go-blueprint/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('8dbc61ccb9df6583bf6cd0ad23ca0a38e1eb0655f38eb85ec2b71b71392d5060')
sha256sums_aarch64=('fdb71de2e424c856c380a38bc2dfd69f04daf9d5d694096836b0821fa7fee341')
sha256sums_x86_64=('36b833a4ad24bd286e41fa2e853182e7c9aa02fc47573fda7db4243b7596bdfd')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/completions/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    if [ -x "/usr/bin/fish" ]; then
        install -Dm644 "${srcdir}/completions/${pkgname%-bin}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
    fi
    if [ -x "/usr/bin/zsh" ]; then
        install -Dm644 "${srcdir}/completions/${pkgname%-bin}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}"
    fi
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}