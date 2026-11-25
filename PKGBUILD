# Maintainer: czyt <czytcn@gmail.com>
pkgname=pig-bin
pkgver=0.8.0
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
sha256sums_x86_64=('e5f4188b193b5b9722039c9cb8378b2dbd62d1aeebaeda1a62589ac1303ef23c')
sha256sums_aarch64=('ec7abf7cd366526cc76ce2c72f4a195e13bde748f9ec9512c5c09965a22f0e84')

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
