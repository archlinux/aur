# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
_pkgname=mindustry-server
pkgname=${_pkgname}-bin
pkgver=97
pkgrel=1
pkgdesc="Server of a sandbox tower defense game written in Java"
arch=("any")
url="https://github.com/Anuken/Mindustry"
license=("GPL3")
depends=("java-runtime=8" "sh" "hicolor-icon-theme")
makedepends=("libicns")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}-${pkgver}.jar::https://github.com/Anuken/Mindustry/releases/download/v${pkgver}/server-release.jar"
        "${pkgname}.icns::https://github.com/Anuken/Mindustry/raw/master/core/assets/icons/icon.icns"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=('cb0d23945305f8671b33385eb95b2384355fd8e352e443aad821f54d0a20c789'
            '16fcae782b13a8460e631d265c505f56393acd14700b016904744bd44aa290eb'
            '679727847ba70773cee4f902114345e095b27f425aa00c4d3860d247705ed1f0'
            '053030932334f40145e927f6c7e9ebf01bd28ddd1e7b9fba6234b51cc83ad241')
noextract=("${pkgname}-${pkgver}.jar")

build() {
  icns2png --extract "${pkgname}.icns"
}

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  local icon_size; for icon_size in 256 512 1024; do
    install -Dm644 "${pkgname}_${icon_size}x${icon_size}x32.png" \
      "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${_pkgname}.png"
  done
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm755 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/Mindustry.jar"
  install -Dm755 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/server-release.jar"
}
