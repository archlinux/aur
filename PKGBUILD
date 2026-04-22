# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=stock-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Package/tool/runtime installer — companion to store (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/cushycush/stock'
license=('MIT')
depends=('glibc')
conflicts=('stock' 'stock-git')
provides=('stock')

source=(
    "README-${pkgver}.md::https://raw.githubusercontent.com/cushycush/stock/v${pkgver}/README.md"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/cushycush/stock/v${pkgver}/LICENSE"
)
sha256sums=('3fcd702d9488dd4d71f96b868e06b54c9745f12c6569c2473f00208549462070'
            'c4c73cfe3e7d8e4cae57635b5d7bde8f256d5eb8e5766ce80b22b0cf3de9cca5')

source_x86_64=("stock-x86_64-${pkgver}.zip::https://github.com/cushycush/stock/releases/download/v${pkgver}/stock-v${pkgver}-linux-amd64.zip")
sha256sums_x86_64=('1ffdb6f21632d2be918c545ca178af474760eb1ef97695813cc9b0bcb6917a34')

source_aarch64=("stock-aarch64-${pkgver}.zip::https://github.com/cushycush/stock/releases/download/v${pkgver}/stock-v${pkgver}-linux-arm64.zip")
sha256sums_aarch64=('204e8a82b52a497de53af6e9e5cec73286cdcfc74d4da5fa44a2e152cd7e64a2')

package() {
    # Architecture-specific binary. The downloaded zip contains a single
    # stock-vX.Y.Z-linux-{amd64,arm64} executable; rename to /usr/bin/stock.
    local binary_name
    case "${CARCH}" in
        x86_64)  binary_name="stock-v${pkgver}-linux-amd64" ;;
        aarch64) binary_name="stock-v${pkgver}-linux-arm64" ;;
    esac

    install -Dm755 "${srcdir}/${binary_name}" "${pkgdir}/usr/bin/stock"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
