# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=belt-bin
pkgver=1.28.10
pkgrel=1
pkgdesc="CLI for inference.sh - run AI apps, manage skills, connect MCP servers"
arch=('x86_64' 'aarch64')
url="https://inference.sh/belt"
license=('MIT')
depends=('glibc')
provides=('belt' 'infsh' 'inferencesh')
conflicts=('belt' 'infsh' 'inferencesh')
options=('!strip' '!emptydirs')

source=("LICENSE")
source_x86_64=("inferencesh-cli-v${pkgver}-linux-amd64.tar.gz::https://dist.inference.sh/cli/v${pkgver}/inferencesh-cli-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("inferencesh-cli-v${pkgver}-linux-arm64.tar.gz::https://dist.inference.sh/cli/v${pkgver}/inferencesh-cli-v${pkgver}-linux-arm64.tar.gz")

sha256sums=('2b8447683453e9a1eab7364b149fcb2066f68ef0e1db1dd1fade2792f6d4cc96')
sha256sums_x86_64=('5e6a0d02e701c0b37a563fddcae69d0a2da97517d3ef45f070a09b86595eb757')
sha256sums_aarch64=('ae449008e7794d9a52e60a79a2723106124f4de4e9110041522c8efbb096645c')

package() {
    local _dist_arch
    case "$CARCH" in
        x86_64) _dist_arch="amd64" ;;
        aarch64) _dist_arch="arm64" ;;
        *) echo "Unsupported architecture: $CARCH" >&2; return 1 ;;
    esac

    install -Dm755 "${srcdir}/inferencesh-cli-v${pkgver}-linux-${_dist_arch}" "${pkgdir}/usr/bin/belt"
    ln -s belt "${pkgdir}/usr/bin/infsh"
    ln -s belt "${pkgdir}/usr/bin/inferencesh"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
