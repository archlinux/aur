# Maintainer: Wendy Labs Inc. <support@wendy.sh>
pkgname=wendy
_pkgver=2026.01.29-085821
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
sha256sums_x86_64=('4e545d5a23092a62029bc70d0fc325ee39a9cd7a55f581393b44d019c279522c')
sha256sums_aarch64=('fa014609ff264418b13a59d677b961ba6a1bfb9a876066b262ce571931e7e6ec')

package() {
    cd "${srcdir}"

    # Find the extracted directory
    if [[ "${CARCH}" == "x86_64" ]]; then
        install -Dm755 "wendy-cli-linux-static-musl-x86_64/wendy" "${pkgdir}/usr/bin/wendy"
    else
        install -Dm755 "wendy-cli-linux-static-musl-aarch64/wendy" "${pkgdir}/usr/bin/wendy"
    fi
}
