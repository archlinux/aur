# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ecapture
pkgname=${_pkgname}-bin
pkgver="0.8.8"
pkgrel="1"
pkgdesc="Capturing SSL/TLS plaintext without a CA certificate using eBPF. (Binary)"
arch=('x86_64' 'aarch64')
url="https://ecapture.cc/"
license=('Apache-2.0')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("https://github.com/gojue/ecapture/releases/download/v${pkgver}/ecapture-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/gojue/ecapture/releases/download/v${pkgver}/ecapture-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=("c54f71e6095c54a8961be68463b4fb7279a1e4fd3df159b9a6d0b132eaa7e0b6")
sha256sums_aarch64=("d8914e762113d5d57b9feeeb50b376ee6880f18d0da295d05f7cafddebe6e768")

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
