# Maintainer: James Barrios <hey@dendarrion.com>

pkgname=ttf-juliamono-nerd-font
pkgver=0.056
pkgrel=2
pkgdesc="JuliaMono, a font for programming, patched with Nerd Fonts (Regular, Mono, Propo)"
arch=('any')
url="https://github.com/mietzen/juliamono-nerd-font"
_variant="https://github.com/dendarrion/juliamono-nerd-font-variant"
license=('custom:SIL Open Font License v1.1')
source=(
    "${pkgname}-mono-v${pkgver}::${url}/releases/download/v${pkgver}/fonts.zip"
    "${pkgname}-variant-v${pkgver}::${_variant}/releases/download/v${pkgver}/ttf-juliamono-nerd-font-variant-v${pkgver}.zip"
    "${pkgname}-license::https://raw.githubusercontent.com/mietzen/juliamono-nerd-font/main/LICENSE"
)
noextract=("${source[0]%%::*}" "${source[1]%%::*}")

prepare() {
    mkdir -p font/mono
    bsdtar -xf "${pkgname}-mono-v${pkgver}" -C font/mono
    bsdtar -xf "${pkgname}-variant-v${pkgver}"
}

package() {
    install -dm644 "${pkgdir}/usr/share/fonts/TTF/juliamono-nerd"/{mono,propo,regular}
    cp -rt "${pkgdir}/usr/share/fonts/TTF/juliamono-nerd" "font/"{mono,propo,regular}
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgname}-license"
}

sha256sums=('SKIP' 'SKIP' 'SKIP')
