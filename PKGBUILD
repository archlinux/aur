# Maintainer: Wendy Labs Inc. <support@wendy.dev>
pkgname=wendy
_pkgver=2026.11.10-171632
_pkgtag=2026.11.10-171632
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Wendy CLI - Remote device debugging and deployment for Raspberry Pi, NVIDIA Jetson, and other Linux devices"
arch=('x86_64' 'aarch64')
url="https://wendy.dev"
license=('custom:proprietary')
provides=('wendy')
conflicts=('wendy-git')
depends=('usbutils' 'ca-certificates')

source_x86_64=("${pkgname}-${_pkgver}-x86_64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-cli-linux-amd64-${_pkgver}.tar.gz")
source_aarch64=("${pkgname}-${_pkgver}-aarch64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-cli-linux-arm64-${_pkgver}.tar.gz")

# Checksums will be updated by CI
sha256sums_x86_64=('5b7ea806b6a521c193b7a2d84ddf7b2d2a3d1a96958ee93935f1cbf15c6363f1')
sha256sums_aarch64=('184b74865e2bff17b1792445f6a307ae7c16229474c20ee4a5b68fff0d08b692')

package() {
    cd "${srcdir}"

    # Find the extracted directory
    if [[ "${CARCH}" == "x86_64" ]]; then
        install -Dm755 "wendy-cli-linux-amd64/wendy" "${pkgdir}/usr/bin/wendy"
    else
        install -Dm755 "wendy-cli-linux-arm64/wendy" "${pkgdir}/usr/bin/wendy"
    fi
}
