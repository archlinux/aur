# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ecapture
pkgname=${_pkgname}-bin
pkgver="1.4.3"
pkgrel="1"
pkgdesc="Capturing SSL/TLS plaintext without a CA certificate using eBPF. (Binary)"
arch=('x86_64' 'aarch64')
url="https://ecapture.cc/"
license=('Apache-2.0')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("https://github.com/gojue/ecapture/releases/download/v${pkgver}/ecapture-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/gojue/ecapture/releases/download/v${pkgver}/ecapture-v${pkgver}-linux-arm64.tar.gz")

# https://github.com/gojue/ecapture/releases/download/v$pkgver/checksum-v$pkgver.txt
sha256sums_x86_64=("1ab36081fcb8793aafbe0530f18efbd5866beba8aae7826569851a622eadfbf4")
sha256sums_aarch64=("3348be71efb8f999919b6f2fcfd0ec302e50aee0431c53c6c99ff5c7b12b35ef")

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
