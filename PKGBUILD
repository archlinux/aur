# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=dnglab-bin
pkgver=0.6.0
pkgrel=3
pkgdesc="Camera RAW to DNG file format converter"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/dnglab/dnglab"
license=('LGPL-2.1-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glibc'
)
optdepends=(
    'bash-completion'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb")
sha256sums_aarch64=('0b902d1453afe89b777658041d1e5b27b4865690c2ec9f5640661200fd894174')
sha256sums_x86_64=('60b02849e56db7680118c6b6d42d131bec48104c7e9b747d61745b9a8b58bd88')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}.bash" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/man/man1/"*.gz -t "${pkgdir}/usr/share/man/man1"
}