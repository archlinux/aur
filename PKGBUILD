# Maintainer: Veya Fürst <0xveya@gmail.com>
pkgname=gns3util
pkgver=1.2.8
pkgrel=1
pkgdesc="GNS3 API utility for managing GNS3v3 servers"
arch=('x86_64' 'aarch64')
url="https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-amd64.tar.gz"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source_x86_64=("https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-amd64.tar.gz")
source_aarch64=("https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-arm64.tar.gz")
sha256sums_x86_64=("bd82516bcae0733e1d59c5eaab1cc8ef5d2c8ca5b37d6472b6a0ea2516f69b37")
sha256sums_aarch64=("86f089bcd943265c7bc0d568260483b94b17c1c6afb050cb197e7a2d36dd7116")

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
