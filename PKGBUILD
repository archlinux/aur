# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ecapture
pkgname=${_pkgname}-bin
pkgver="2.4.1"
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
sha256sums_x86_64=("f7ea5f8627acca0ce3e2e597de8b0658b5d160be1802b07904293295a7ab20e6")
sha256sums_aarch64=("513ab836f1723af6087885cbcebf08064e925f167f4d5de09b20bfd5be24b275")

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
