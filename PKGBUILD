# Maintainer: czyt <czytcn@gmail.com>
pkgname=pig-bin
pkgver=0.5.1
pkgrel=2
pkgdesc="PiG (Pi in Go) - a Go port of the Pi coding agent"
arch=('x86_64' 'aarch64')
url="https://pi-in-go.dev"
license=('MIT')
provides=('pig')
conflicts=('pig')
options=('!strip' '!debug')
source_x86_64=("pig-${pkgver}-linux-amd64.tar.gz::https://github.com/MichaelKinsy/PiG/releases/download/v${pkgver}/pig-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("pig-${pkgver}-linux-arm64.tar.gz::https://github.com/MichaelKinsy/PiG/releases/download/v${pkgver}/pig-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('71d10c0559486384ab2ef88108c59e555755b8e770cd1f14e5db02d3be01f1f1')
sha256sums_aarch64=('a2fc84f8d5630d6ab54912b2af371368a71160841f4fe6c52a87816f84e0919b')

package() {
    local _arch="amd64"
    [[ "${CARCH}" == "aarch64" ]] && _arch="arm64"
    local _dir="pig-${pkgver}-linux-${_arch}"

    install -Dm755 "${srcdir}/${_dir}/pig" "${pkgdir}/usr/bin/pig"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -a "${srcdir}/${_dir}/LICENSE" \
          "${srcdir}/${_dir}/NOTICE" \
          "${srcdir}/${_dir}/THIRD_PARTY_NOTICES.md" \
          "${srcdir}/${_dir}/LICENSES" \
          "${pkgdir}/usr/share/licenses/${pkgname}/"
}
