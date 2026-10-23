# Maintainer: czyt <czytcn@gmail.com>
pkgname=pig-bin
pkgver=0.5.3
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
sha256sums_x86_64=('1e45e5e591a06d087587d5f09d2b6d61673a1e262cb2609e6189defffd5ae7ec')
sha256sums_aarch64=('c94acaa8b2a5d3d2b1f59e679f70bba6762dc7a01655369b2ffc40fb9be4552b')

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
