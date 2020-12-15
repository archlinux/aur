# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
_pkgname=mindustry
pkgname="${_pkgname}-bin"
_build=121.3
pkgver="6.0_${_build}"
pkgrel=1
epoch=1
pkgdesc="A sandbox tower defense game written in Java"
arch=("any")
url="https://github.com/Anuken/Mindustry"
license=("GPL3")
depends=("java-runtime>=8" "sh" "hicolor-icon-theme")
makedepends=("libicns")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}-${_build}.jar::https://github.com/Anuken/Mindustry/releases/download/v${_build}/Mindustry.jar"
        "${pkgname}.icns::https://github.com/Anuken/Mindustry/raw/v${_build}/core/assets/icons/icon.icns"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('33f79114b14a91bdf039e788cbbb1ad1edc55a80543446ff23a550e0987c35e2'
            '16fcae782b13a8460e631d265c505f56393acd14700b016904744bd44aa290eb'
            'e5fd49ed3456c53e91b834cb388956e3f9ded4e2c880352d36cf9c2246ca0f0b'
            '938f5f9f636379402ba0bb9a53345de499f4f3fd50f232b31605129dcf4ea6c9')
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
  install -Dm755 "${pkgname}-${_build}.jar" "${pkgdir}/usr/share/java/${_pkgname}/Mindustry.jar"
}
