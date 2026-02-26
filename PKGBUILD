# Maintainer: James Barrios <hey@dendarrion.com>

pkgname=ttf-juliamono-nerd-font
pkgver=0.062
pkgrel=1
pkgdesc="JuliaMono, a font for programming, patched with Nerd Fonts (Regular, Mono, Propo)"
arch=('any')
url="https://github.com/mietzen/juliamono-nerd-font"
_variant="https://github.com/dendarrion/juliamono-nerd-font-variant"
license=('OFL-1.1')
source=(
    "${pkgname}-mono-v${pkgver}::${url}/releases/download/v${pkgver}/fonts.zip"
    "${pkgname}-variant-v${pkgver}::${_variant}/releases/download/v${pkgver}/fonts-variant.zip"
    "${pkgname}-license::https://raw.githubusercontent.com/mietzen/juliamono-nerd-font/main/LICENSE"
)
noextract=("${source[0]%%::*}" "${source[1]%%::*}")

prepare() {
    mkdir -p font/{mono,variant}
    bsdtar -xf "${pkgname}-mono-v${pkgver}" -C font/mono
    bsdtar -xf "${pkgname}-variant-v${pkgver}" -C font/variant
}

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF/juliamono-nerd"/{mono,variant}
    cp -rt "${pkgdir}/usr/share/fonts/TTF/juliamono-nerd" "font/"{mono,variant}
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgname}-license"
}

sha256sums=('9c0f5c74d0d38a2ac70a9ab5638ed497c206da7691816771a9e7006070afe029'
            'dd329bcba3e4565f8b6d81683cbce65559a1915a2b93a4baf9db951f29e880f2'
            'd27b85137453d4eb0893eee45bdc6eb79a661693680856f3f7df8bc77dfe902f')
