# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor Foruzesh <mahorforuzesh at protonmail dot com>

pkgname=tachidesk-preview
#pkgver=v0.3.0.r440
pkgver=$(curl -s "https://raw.githubusercontent.com/Suwayomi/Tachidesk-Server-preview/main/index.json" | cut -d" " -f3 | cut -d\" -f2 | sed 's/-/./g')
pkgrel=1
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/Tachidesk-Server-preview"
license=("MPL2")
depends=("java-runtime")
provides=("tachidesk")
conflicts=("tachidesk")
_semver=$(printf ${pkgver} | cut -d'.' -f4 --complement)
_commit=$(printf ${pkgver} | cut -d'.' -f4)
_jar=Tachidesk-Server-${_semver}-${_commit}.jar

source=("${_jar}::${url}/releases/download/${_semver}-${_commit}/${_jar}" 
        "tachidesk.desktop"
        "tachidesk.png"
        "tachidesk.sh")
md5sums=('SKIP'
         'd5a18adf71fa79c06f142e07682b627e'
         '520cdde66717d1701fb40dfbcdab59a2'
         '196d4e69879d3b01f73672c812c0f20c')
noextract=("${source[@]%%::*}")

package() {
    install -d "${pkgdir}/usr/share/java/${pkgname}"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps" 
    install -d "${pkgdir}/usr/bin"
    
    desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/tachidesk.desktop"
    install -Dm755 "${srcdir}/${_jar}"          "${pkgdir}/usr/share/java/tachidesk/tachidesk.jar"
    install -Dm755 "${srcdir}/tachidesk.png"   "${pkgdir}/usr/share/pixmaps/tachidesk.png"
    install -Dm755 "${srcdir}/tachidesk.sh"    "${pkgdir}/usr/bin/tachidesk-preview"
}
