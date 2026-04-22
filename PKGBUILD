# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=stock-bin
pkgver=0.2.0
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
sha256sums=('SKIP'
            'SKIP')

source_x86_64=("stock-x86_64-${pkgver}.zip::https://github.com/cushycush/stock/releases/download/v${pkgver}/stock-v${pkgver}-linux-amd64.zip")
sha256sums_x86_64=('SKIP')

source_aarch64=("stock-aarch64-${pkgver}.zip::https://github.com/cushycush/stock/releases/download/v${pkgver}/stock-v${pkgver}-linux-arm64.zip")
sha256sums_aarch64=('SKIP')

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
