# Maintainer: JunYoung Gwak <aur@jgwak.com>
# Contributor: Augustin deMayo <gus.demayo@gmail.com>

pkgname="desktop-dimmer"
fullpkgname="Desktop Dimmer"
pkgver=4.0.4
pkgrel=2
pkgdesc="Enables darker-than-dark Desktop dimming for your displays."
arch=("x86_64")
url="https://github.com/sidneys/${pkgname}"
license=('Custom:CC0-1.0')
source=("https://github.com/sidneys/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.pacman"
        "LICENSE::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt")
md5sums=('bd4370ee7d3e11ba8c5114481f8ddb7b'
         '65d3616852dbf7b1a6d4b53b00626032')
depends=('libxtst' 'gtk2' 'gconf' 'libxss' 'alsa-lib')
replace_str="\/opt\/${fullpkgname}\/${pkgname}"

package() {
    cd "${srcdir}/"
    install -dm755 "${pkgdir}/opt/"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/opt/${fullpkgname}" "${pkgdir}/opt/"
    cp -r "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${fullpkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    sed -i "s/${replace_str}/${pkgname}/g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
