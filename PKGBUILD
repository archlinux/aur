# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ecapture
pkgname=${_pkgname}-bin
pkgver="0.9.0"
pkgrel="1"
pkgdesc="Capturing SSL/TLS plaintext without a CA certificate using eBPF. (Binary)"
arch=('x86_64' 'aarch64')
url="https://ecapture.cc/"
license=('Apache-2.0')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("https://github.com/gojue/ecapture/releases/download/v${pkgver}/ecapture-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/gojue/ecapture/releases/download/v${pkgver}/ecapture-v${pkgver}-linux-arm64.tar.gz")

# https://github.com/gojue/ecapture/releases/download/v${pkgver}/checksum-v${pkgver}.txt
sha256sums_x86_64=("b443e7ffa01fbb45fd8accde0173caa093d7e140cd114bcfd4b4348e22fc1b2b")
sha256sums_aarch64=("a4720626698fbf31e659104338a8e222ee27524f74bf9c248756abaabb41525a")

package() {
    case "${CARCH}" in
        x86_64)
            cd "${srcdir}/ecapture-v${pkgver}-linux-amd64"
            ;;
        aarch64)
            cd "${srcdir}/ecapture-v${pkgver}-linux-arm64"
            ;;
    esac
    install -Dm755 "./ecapture" "${pkgdir}/usr/bin/ecapture"
    install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/ecapture/README.md"
    install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/ecapture/LICENSE"
}
