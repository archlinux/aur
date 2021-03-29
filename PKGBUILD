# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor Foruzesh <mahorforuzesh at protonmail dot com>

pkgname=tachidesk
pkgver=0.2.7.r312
pkgrel=1
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/Tachidesk"
license=("MPL2")
depends=("java-runtime")
provides=("tachidesk")

_semver=$(printf ${pkgver} | cut -d'.' -f4 --complement)
_commits=$(printf ${pkgver} | cut -d'.' -f4)
_fetch_url="${url}/releases/download/v${_semver}/Tachidesk-v${_semver}-${_commits}.jar"

source=("${pkgname}-${pkgver}.jar::${_fetch_url}" 
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('d05260628ffebe1f92c497f14d16043f'
         '728182fd92daa4e50b98c0d62bb65c5e'
         '520cdde66717d1701fb40dfbcdab59a2'
         '196d4e69879d3b01f73672c812c0f20c')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}.png"           "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
    install -Dm755 "${srcdir}/${pkgname}.sh"            "${pkgdir}/usr/bin/${pkgname}"
}
