# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

pkgname="ttf-nerd-fonts-symbols"
pkgdesc="Developer targeted patched fonts with a high number of glyphs (icons)"
pkgver=2.0.0
pkgrel=2
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
arch=('x86_64' 'i686')
source=(
# Git repository is very large so download files individually over https
"https://raw.githubusercontent.com/ryanoasis/nerd-fonts/${pkgver}/src/glyphs/Symbols-2048-em%20Nerd%20Font%20Complete.ttf"
"https://raw.githubusercontent.com/ryanoasis/nerd-fonts/${pkgver}/10-nerd-font-symbols.conf"
"https://raw.githubusercontent.com/ryanoasis/nerd-fonts/${pkgver}/LICENSE"
)
sha256sums=('5699e72fdd41ab97bc1e786ef6c0a8b2418e883880c56103bee88a441db71e1d'
            '487646ad535617edef383e9205200dc3ff0def58890a4a3b6491e384a5a79a52'
            'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

prepare() {
    cd "${srcdir}"
    link="$(readlink -e "10-nerd-font-symbols.conf")"
    rm "10-nerd-font-symbols.conf"
    cp "$link" "10-nerd-font-symbols.conf"
}

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}/etc/fonts/conf.d"
    install -Dm644 "Symbols-2048-em%20Nerd%20Font%20Complete.ttf" "${pkgdir}/usr/share/fonts/TTF/Nerd Font Complete.ttf"
    install -Dm644 "10-nerd-font-symbols.conf" "${pkgdir}/etc/fonts/conf.avail/10-nerd-font-symbols.conf"
    ln -s "../conf.avail/10-nerd-font-symbols.conf" "${pkgdir}/etc/fonts/conf.d/10-nerd-font-symbols.conf"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
