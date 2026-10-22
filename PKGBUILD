# Maintainer: czyt <czytcn@gmail.com>
pkgname=pig-bin
pkgver=0.5.2
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
sha256sums_x86_64=('c878c8c13b354abefc04994c20a95daf892a6eea5efe5aa59768885e97594206')
sha256sums_aarch64=('96c52a3ee27f91ed14fb6856a1c168c85d9ee0bb24e4a571938901f97ff75259')

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
