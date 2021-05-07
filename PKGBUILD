# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor Foruzesh <mahorforuzesh at protonmail dot com>

pkgname=tachidesk-preview
#pkgver=v0.3.0.r440
pkgver=$(curl -s "https://raw.githubusercontent.com/Suwayomi/Tachidesk/preview/index.json" | cut -d" " -f3 | cut -d\" -f2 | sed 's/-/./g')
pkgrel=1
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/Tachidesk"
license=("MPL2")
depends=("java-runtime")
provides=("tachidesk")
conflicts=("tachidesk")
_semver=$(printf ${pkgver} | cut -d'.' -f4 --complement)
_commit=$(printf ${pkgver} | cut -d'.' -f4)
_jar=Tachidesk-${_semver}-${_commit}.jar

source=("${_jar}::${url}/raw/preview/Tachidesk-latest.jar" 
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('SKIP'
         '56416e12cee7b01efa1bc01cb513b900'
         '520cdde66717d1701fb40dfbcdab59a2'
         'eb4cfc5adf0cb6ff2a6a7c2fcbfa3be7')
noextract=("${source[@]%%::*}")

package() {
    install -d "${pkgdir}/usr/share/java/${pkgname}"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps" 
    install -d "${pkgdir}/usr/bin"
    
    desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${_jar}"          "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm755 "${srcdir}/${pkgname}.png"   "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "${srcdir}/${pkgname}.sh"    "${pkgdir}/usr/bin/${pkgname}"
}
