# Maintainer: James Barrios <hey@dendarrion.com>

pkgname=ttf-juliamono-nerd-font
pkgver=0.057
pkgrel=1
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

sha256sums=(
    '5ae04001374093c52db7cc1726e4c0519d051022643c348477c32a034eaf4ddb'
    'a89d190df85fdbb628c4d561fa98a3b67cc900eba8990fad0a35bc84cc3f7575'
    'd27b85137453d4eb0893eee45bdc6eb79a661693680856f3f7df8bc77dfe902f'
)
