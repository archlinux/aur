# Maintainer: YOUR NAME <your@email.com>

pkgname=tobby-bin
pkgver=0.1.24
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
sha256sums_x86_64=('0dbeb43949217f087fa659d36ec1eef0639814b115160b118e4a6414371b2b6a')

source_aarch64=(
    "tobby-${pkgver}-aarch64::https://github.com/ObsidianIRC/tobby/releases/download/v${pkgver}/tobby-aarch64-linux"
)
sha256sums_aarch64=('42af75b50e6ed892cb4efbdfa1a12fbbb25278756714cd2885091d9138954843')

# Do NOT strip — bun --compile embeds the JS bytecode after the ELF sections
# in a non-standard layout that strip will corrupt.
options=('!strip')

package() {
    install -Dm755 "${srcdir}/tobby-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/tobby"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
