# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ecapture
pkgname=${_pkgname}-bin
pkgver="2.3.0"
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
sha256sums_x86_64=("6df3740bd37d8ab885dfbda1a3b19a77eb990b7cc7f12d361775f819e4ec0735")
sha256sums_aarch64=("e722a9b1057fb471046fae5f4ef669c702f2ff1c6659b8ab915ff591f88c4341")

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
