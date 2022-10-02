# Maintainer: TheAirBlow <pilexet.danila@gmail.com>
_pkgname=mindustry-foos-client
pkgname="${_pkgname}-bin"
_build=1198
pkgver="7.0_${_build}"
pkgrel=1
epoch=1
pkgdesc="Client modification for Mindustry"
arch=("any")
url="https://github.com/mindustry-antigrief/mindustry-client"
license=("GPL3")
depends=("java-runtime>=8" "sh" "hicolor-icon-theme")
makedepends=("libicns")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}-${_build}.jar::https://github.com/mindustry-antigrief/mindustry-client-v7-builds/releases/download/${_build}/desktop.jar"
        "${pkgname}.icns::https://github.com/mindustry-antigrief/mindustry-client/raw/v7/core/assets/icons/icon.icns"
        "${pkgname}.desktop"
        "${pkgname}.sh")
noextract=("${pkgname}-${_build}.jar")

build() {
  icns2png --extract "${pkgname}.icns"
}

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  local icon_size; for icon_size in 256 512 1024; do
    install -Dm644 "${pkgname}_${icon_size}x${icon_size}x32.png" "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${_pkgname}.png"
  done
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm755 "${pkgname}-${_build}.jar" "${pkgdir}/usr/share/java/${_pkgname}/Mindustry.jar"
  echo "WARNING: On the first run required .JARs will be created in the game's directorty,"
  echo "WARNING: thus requires to run it with root permissions."
}

sha256sums=('5a9b68ee4b2d22b3688b9a9d864466b5d1f40814789acfb703c56099973d2d8b'
            '16fcae782b13a8460e631d265c505f56393acd14700b016904744bd44aa290eb'
            '93f661599e14456f27c3adb92c31538a3b707e11876310a8440430cb23ada8b1'
            '6827b29e2afc023089c4d46c6dde3fccf3ad01554ba6c22c20e7bce7a109224f')
