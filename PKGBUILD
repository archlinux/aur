# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=dnglab-bin
pkgver=0.7.0
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
sha256sums_aarch64=('d48f80d64a34dc20d85f886f0c303d43b6368c22a9935623d1851191b85c4507')
sha256sums_x86_64=('b1c2dda13777c92a4666720543c6ed54d8b47180352daa1fa719c7461badf71b')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}.bash" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/man/man1/"*.gz -t "${pkgdir}/usr/share/man/man1"
}
