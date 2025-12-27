# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ecapture
pkgname=${_pkgname}-bin
pkgver="1.5.2"
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
sha256sums_x86_64=("963f9d73dd50230eee25dbb4ab7fd150592f2363ea4a9cc2be754e022d946570")
sha256sums_aarch64=("16d14f5f49670602e88b6ababbcde3d951d26fe35ceeb15510ee5efdce9794ee")

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
