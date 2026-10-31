# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ecapture
pkgname=${_pkgname}-bin
pkgver="2.9.1"
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
sha256sums_x86_64=('07fd3ad9db48b3747aa131ab807b4ab0430bb534b738ce3a6ed22d57e57d6164')
sha256sums_aarch64=('e34a415d1858cb141524452d621450bfa4266ea148cb72a4ac1ec8b226d5713d')

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
