# Maintainer: czyt <czytcn@gmail.com>
pkgname=pig-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="PiG (Pi in Go) - a Go port of the Pi coding agent"
arch=('x86_64' 'aarch64')
url="https://pi-in-go.dev"
license=('MIT')
provides=('pig')
conflicts=('pig')
options=('!strip' '!debug')
source_x86_64=("pig-${pkgver}-linux-amd64.tar.gz::https://github.com/MichaelKinsy/PiG/releases/download/v${pkgver}/pig-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("pig-${pkgver}-linux-arm64.tar.gz::https://github.com/MichaelKinsy/PiG/releases/download/v${pkgver}/pig-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('0b5ab7cb5f680e7d3353bdaa3a1018863c3c3552f88bec730370668e5819995a')
sha256sums_aarch64=('88d2dcb4a4852a980dc1ca9202eed9455ff8fb011553c8db62c1b85c676a366b')

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
