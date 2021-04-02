# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor Foruzesh <mahorforuzesh at protonmail dot com>

pkgname=tachidesk
pkgver=0.2.7.r312
pkgrel=1
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/Tachidesk"
license=("MPL2")
depends=("java-runtime" "hicolor-icon-theme")
provides=("tachidesk")

_semver=$(printf v${pkgver} | cut -d'.' -f4 --complement)
_commit=$(printf ${pkgver} | cut -d'.' -f4)
_jar=Tachidesk-${_semver}-${_commit}.jar

source=("${url}/releases/download/${_jar}" 
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('d05260628ffebe1f92c497f14d16043f'
         '728182fd92daa4e50b98c0d62bb65c5e'
         '520cdde66717d1701fb40dfbcdab59a2'
         '196d4e69879d3b01f73672c812c0f20c')

package() {
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}/"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
    mkdir -p "${pkgdir}/usr/bin"
    
    desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${_jar}" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm755 "${srcdir}/${pkgname}.png"           "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
    install -Dm755 "${srcdir}/${pkgname}.sh"            "${pkgdir}/usr/bin/${pkgname}"
}
