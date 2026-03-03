# Maintainer: YOUR NAME <your@email.com>

pkgname=tobby-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="The Terminal Obby — a modern IRC client for the terminal (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/ObsidianIRC/tobby"
license=('MIT')
# The binary is produced by `bun build --compile`, which embeds the Bun
# runtime — no runtime dependencies needed.
depends=()
makedepends=()
provides=('tobby')
conflicts=('tobby')

source=(
    "LICENSE::https://raw.githubusercontent.com/ObsidianIRC/tobby/v${pkgver}/LICENSE"
)
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

source_x86_64=(
    "tobby-${pkgver}-x86_64::https://github.com/ObsidianIRC/tobby/releases/download/v${pkgver}/tobby-x86_64-linux"
)
sha256sums_x86_64=('fe9f68a6540d3af6c996d83053549056a56042572bf4625d926c2d48b7af3fa4')

source_aarch64=(
    "tobby-${pkgver}-aarch64::https://github.com/ObsidianIRC/tobby/releases/download/v${pkgver}/tobby-aarch64-linux"
)
sha256sums_aarch64=('e8b47050656347c049e627f49a596d8a26ad66a957a693b67f11c7bdcbe3b971')

# Do NOT strip — bun --compile embeds the JS bytecode after the ELF sections
# in a non-standard layout that strip will corrupt.
options=('!strip')

package() {
    install -Dm755 "${srcdir}/tobby-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/tobby"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
