# Maintainer: James Barrios <hey@dendarrion.com>

pkgname=ttf-juliamono-nerd-font
pkgver=0.059
pkgrel=1
pkgdesc="JuliaMono, a font for programming, patched with Nerd Fonts (Regular, Mono, Propo)"
arch=('any')
url="https://github.com/mietzen/juliamono-nerd-font"
_variant="https://github.com/dendarrion/juliamono-nerd-font-variant"
license=('OFL-1.1')
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
    install -dm755 "${pkgdir}/usr/share/fonts/TTF/juliamono-nerd"/{mono,propo,regular}
    cp -rt "${pkgdir}/usr/share/fonts/TTF/juliamono-nerd" "font/"{mono,propo,regular}
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgname}-license"
}

sha256sums=('bcfa690cd1efd80545ef5a690916ae203a7b6dd20fa445d97895dfc93ac08386'
            'e5356a5b0a4aea516c8a7fc0b2b484c5da6321868bdd0b245d319bade20e6707'
            'd27b85137453d4eb0893eee45bdc6eb79a661693680856f3f7df8bc77dfe902f')
