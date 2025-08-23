# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ecapture
pkgname=${_pkgname}-bin
pkgver="1.4.1"
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
sha256sums_x86_64=("387a58eab0eb817527c599da0e59a772a7268a3c4b8389216a5e471eaa11c86c")
sha256sums_aarch64=("b3d9b5429e1b24512b25a215c80db4fda371665e0a20d8079c6610d148974bdd")

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
