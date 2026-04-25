# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=stock-bin
pkgver=0.4.0
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
sha256sums=('003770f83f0114c26910c8a886c8f5ee8f1e02cec984060b187095627a63ad30'
            'c4c73cfe3e7d8e4cae57635b5d7bde8f256d5eb8e5766ce80b22b0cf3de9cca5')

source_x86_64=("stock-x86_64-${pkgver}.zip::https://github.com/cushycush/stock/releases/download/v${pkgver}/stock-v${pkgver}-linux-amd64.zip")
sha256sums_x86_64=('20071c70bd5b19cf26a13c24734660dfb0e2fda4a15368ecb3cbf205041a5c22')

source_aarch64=("stock-aarch64-${pkgver}.zip::https://github.com/cushycush/stock/releases/download/v${pkgver}/stock-v${pkgver}-linux-arm64.zip")
sha256sums_aarch64=('1572c202a7ba3802627e2fae8dfd64f822645b177b828641c6ae6c28ec9143c7')

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
