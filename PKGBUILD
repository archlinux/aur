# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=belt-bin
pkgver=1.18.8
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
sha256sums_x86_64=('df00a57fa8aed50676bbdebd755950faab437aeac7a086df92102109f87a7b59')
sha256sums_aarch64=('06d704324782f7cd616e1a23b3c79dbfabf5ce01046728c1858c9e2f296b9572')

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
