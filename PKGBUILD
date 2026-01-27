# Maintainer: Wendy Labs Inc. <support@wendy.sh>
pkgname=wendy
_pkgver=2026.01.27-194133
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Wendy CLI - Remote device debugging and deployment for Raspberry Pi, NVIDIA Jetson, and other Linux devices"
arch=('x86_64' 'aarch64')
url="https://wendy.sh"
license=('custom:proprietary')
provides=('wendy')
conflicts=('wendy-git')

source_x86_64=("${pkgname}-${_pkgver}-x86_64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgver}/wendy-cli-linux-static-musl-x86_64-${_pkgver}.tar.gz")
source_aarch64=("${pkgname}-${_pkgver}-aarch64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgver}/wendy-cli-linux-static-musl-aarch64-${_pkgver}.tar.gz")

# Checksums will be updated by CI
sha256sums_x86_64=('75591d8dc5759c05f7b2334adad24fdf2af7b57b5492171db14dc80f8534a63f')
sha256sums_aarch64=('daea27c678b727d190163dc41e41729d86ff02e94720ec46a3ad55c19a6303d9')

package() {
    cd "${srcdir}"

    # Find the extracted directory
    if [[ "${CARCH}" == "x86_64" ]]; then
        install -Dm755 "wendy-cli-linux-static-musl-x86_64/wendy" "${pkgdir}/usr/bin/wendy"
    else
        install -Dm755 "wendy-cli-linux-static-musl-aarch64/wendy" "${pkgdir}/usr/bin/wendy"
    fi
}
