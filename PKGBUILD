# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=dnglab-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Camera RAW to DNG file format converter.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/dnglab/dnglab"
license=('LGPL-2.1-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
optdepends=(
    'bash-completion'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb")
sha256sums_aarch64=('e94d3b334154b0bbfeadf6d650d1d63e99955bf2a232a19253d63c812bbee535')
sha256sums_x86_64=('989f794f0eddc34b087879d01c8c1eb569ef1446f2c1951195e6b852edea85c4')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}.bash" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/man/man1/"*.gz -t "${pkgdir}/usr/share/man/man1"
}
