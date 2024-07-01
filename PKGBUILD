# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=dnglab-bin
pkgver=0.6.2
pkgrel=1
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
sha256sums_aarch64=('ecb975be9d4d10ce8c353618674085546d81eb151649b3c7c6bd411fa52d9e8b')
sha256sums_x86_64=('8086ea60c96a208025f964d7162696f163366ed20075793075e3117d474c9c1f')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}.bash" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/man/man1/"*.gz -t "${pkgdir}/usr/share/man/man1"
}