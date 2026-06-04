# Maintainer: Wendy Labs Inc. <support@wendy.sh>
pkgname=wendy
_pkgver=2026.06.04-163109
_pkgtag=2026.06.04-163109
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Wendy CLI - Remote device debugging and deployment for Raspberry Pi, NVIDIA Jetson, and other Linux devices"
arch=('x86_64' 'aarch64')
url="https://wendy.sh"
license=('custom:proprietary')
provides=('wendy')
conflicts=('wendy-git')
depends=('usbutils' 'ca-certificates')

source_x86_64=("${pkgname}-${_pkgver}-x86_64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-cli-linux-amd64-${_pkgver}.tar.gz")
source_aarch64=("${pkgname}-${_pkgver}-aarch64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-cli-linux-arm64-${_pkgver}.tar.gz")

# Checksums will be updated by CI
sha256sums_x86_64=('43b501649f689bb7a3b06fb3b46c7b3305b65d6b9134f4e2df51ab9612333d6f')
sha256sums_aarch64=('7ac58690acf08dcdb7c31cd25e9ebfa21cb55df72a793fbe59153590119284ab')

package() {
    cd "${srcdir}"

    # Find the extracted directory
    if [[ "${CARCH}" == "x86_64" ]]; then
        install -Dm755 "wendy-cli-linux-amd64/wendy" "${pkgdir}/usr/bin/wendy"
    else
        install -Dm755 "wendy-cli-linux-arm64/wendy" "${pkgdir}/usr/bin/wendy"
    fi
}
