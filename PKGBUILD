# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ecapture
pkgname=${_pkgname}-bin
pkgver="2.0.0"
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
sha256sums_x86_64=("98c00877b7a3910e8f33e46c08ba2b3bb8f3e0ffd84d05649ea04602d35b9b93")
sha256sums_aarch64=("0d7a6d01d0a08dfda549b08123673cd7f6ee61a3ec598ffefd336fc0d1a5580c")

package() {
    case "${CARCH}" in
        x86_64)
            cd "${srcdir}/ecapture-v${pkgver}-linux-amd64"
            ;;
        aarch64)
            cd "${srcdir}/ecapture-v${pkgver}-linux-arm64"
            ;;
    esac
    install -Dm0755 "./ecapture" "${pkgdir}/usr/bin/ecapture"
    install -Dm0644 "./README.md" "${pkgdir}/usr/share/doc/ecapture/README.md"
    install -Dm0644 "./LICENSE" "${pkgdir}/usr/share/licenses/ecapture/LICENSE"
}
