# Maintainer: TheAirBlow <pilexet.danila@gmail.com>
_pkgname=mindustry-foos-client
pkgname="${_pkgname}-bin"
_build=763
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
source=("${pkgname}-${_build}.jar::https://github.com/mindustry-antigrief/mindustry-client-v7-builds/releases/download/761/desktop.jar"
        "${pkgname}.icns::https://github.com/mindustry-antigrief/mindustry-client/blob/v6/core/assets/icons/icon.icns"
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
}

sha256sums=('3b877f309270685ce2ebaaca32ec6a4880aa6eb29fbfc7c7e7243b8ac60da202'
            '47b09296c869a67312e209e5d528cbcfd01532edfc031dba7b6fe2170c2493b6'
            'a18724f42a2a79b129d1901a8b75a965a621eb5ef97698b05cf8addcf5948600'
            '6827b29e2afc023089c4d46c6dde3fccf3ad01554ba6c22c20e7bce7a109224f')
