# Maintainer: Stefan Fürst <stefan20fuerst12@gmail.com>
pkgname=gns3util
pkgver=1.2.5
pkgrel=1
pkgdesc="GNS3 API utility for managing GNS3v3 servers"
arch=('x86_64' 'aarch64')
url="https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-amd64.tar.gz"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source_x86_64=("https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-amd64.tar.gz")
source_aarch64=("https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-arm64.tar.gz")
sha256sums_x86_64=("c1c259c77089f904f2b8f4ff2575e0b58d7443159426b227c4d036cc433b912b")
sha256sums_aarch64=("0819846f31691695c3fa0ad145c975dbd9a48de7bfdeec3e413649928240cfb9")

package() {
    for cand in gns3util gns3util-linux-amd64 gns3util-linux-arm64; do
        if [ -f "$cand" ]; then
            install -Dm755 "$cand" "${pkgdir}/usr/bin/gns3util"
            break
        fi
    done

    if [ -f "man/gns3util.1" ]; then
        install -Dm644 man/gns3util.1 -t "${pkgdir}/usr/share/man/man1"
    fi

    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
