# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=belt-bin
pkgver=1.16.12
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
sha256sums_x86_64=('8532aa9daff3a117033af9b9e558237762f589022bee5c661527c2664701cbed')
sha256sums_aarch64=('ab96f358e9196d8832ab484c7f193c92f10c66e91230b446fa2b1b154342a586')

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
