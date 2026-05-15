# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ecapture
pkgname=${_pkgname}-bin
pkgver="2.4.0"
pkgrel="1"
pkgdesc="Capturing SSL/TLS plaintext without a CA certificate using eBPF. (Binary package from GitHub Releases)"
arch=('x86_64' 'aarch64')
url="https://ecapture.cc/"
license=('Apache-2.0')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("https://github.com/gojue/ecapture/releases/download/v${pkgver}/ecapture-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/gojue/ecapture/releases/download/v${pkgver}/ecapture-v${pkgver}-linux-arm64.tar.gz")

# https://github.com/gojue/ecapture/releases/download/v$pkgver/checksum-v$pkgver.txt
sha256sums_x86_64=("70f3cd4a0d28d28eb981e4c51cfee643ab07b61c8ff119928e77cfa64dffaafd")
sha256sums_aarch64=("3c846a11d05be51b9ef1b1d784a3f736af5f095931e4abdc7ec0272d8bc6a03b")

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
