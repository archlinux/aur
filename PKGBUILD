# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
_pkgname=mindustry-server
pkgname=${_pkgname}-bin
_build=121.1
pkgver="6.0_${_build}"
pkgrel=1
epoch=1
pkgdesc="Server of a sandbox tower defense game written in Java"
arch=("any")
url="https://github.com/Anuken/Mindustry"
license=("GPL3")
depends=("java-runtime>=8" "sh" "hicolor-icon-theme")
makedepends=("libicns")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}-${_build}.jar::https://github.com/Anuken/Mindustry/releases/download/v${_build}/server-release.jar"
        "${pkgname}.icns::https://github.com/Anuken/Mindustry/raw/v${_build}/core/assets/icons/icon.icns"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=('667a25d8b3d087f1424cafaabb97ae00591f2e6231e9d16f89aa64636356c166'
            '16fcae782b13a8460e631d265c505f56393acd14700b016904744bd44aa290eb'
            '679727847ba70773cee4f902114345e095b27f425aa00c4d3860d247705ed1f0'
            '053030932334f40145e927f6c7e9ebf01bd28ddd1e7b9fba6234b51cc83ad241')
noextract=("${pkgname}-${_build}.jar")

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
  install -Dm755 "${pkgname}-${_build}.jar" "${pkgdir}/usr/share/java/${_pkgname}/server-release.jar"
}
