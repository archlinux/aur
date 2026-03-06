# Maintainer: YOUR NAME <your@email.com>

pkgname=tobby-bin
pkgver=0.2.13
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
sha256sums_x86_64=('50a03c2025ac60250a1e13e15078d0864d51da76a2529ff4585f3ee1ef9b9b79')

source_aarch64=(
    "tobby-${pkgver}-aarch64::https://github.com/ObsidianIRC/tobby/releases/download/v${pkgver}/tobby-aarch64-linux"
)
sha256sums_aarch64=('2bb2c807ef68fc4f05f28ddaf99189f8275a0f38a991c369c4f095f69dcda7e1')

# Do NOT strip — bun --compile embeds the JS bytecode after the ELF sections
# in a non-standard layout that strip will corrupt.
options=('!strip')

package() {
    install -Dm755 "${srcdir}/tobby-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/tobby"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
