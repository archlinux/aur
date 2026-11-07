# Maintainer: BlackCherry <blackcherry at danwin1210 dot de>
# Contributor: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>

_pkgname=mindustry
pkgname="${_pkgname}-sdl3-bin"
pkgver=160.7
pkgrel=1
pkgdesc="SDL3 backend version of Mindustry."
url="https://github.com/Anuken/Mindustry"
license=('GPL3')
arch=('x86_64')
options=(!debug)
depends=("java-runtime>=8" "sh" "hicolor-icon-theme")
makedepends=('libicns')
provides=(${_pkgname})
conflicts=(${_pkgname})

# The SDL3 jar is compiled (with the SDL3 patches) by the build action
# (mindustry-sdl3-bin.yml) and published as a GitHub Release asset on tag
# v$pkgver. PKGBUILD sources that pre-built jar; no source build here.
source=("${pkgname}-${pkgver}.jar::https://github.com/BlackCherryCat/my-aur/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar"
        "${pkgname}.icns::https://github.com/Anuken/Mindustry/raw/v${pkgver}/core/assets/icons/icon.icns"
        "${pkgname}.install"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('e7fbd005154bcfec5a0a7dbdff5b45750acf222793d080449dbf1521ce8ac3e7'
            '80aa3f58c2211188e9586b1ef47892956b0bb4042dcea7ea29e954b996ea786f'
            '7e5451947f90876b86ca8a96a285cdddaa7b426dbe71767c03c66dcfe2ddb966'
            'e5fd49ed3456c53e91b834cb388956e3f9ded4e2c880352d36cf9c2246ca0f0b'
            '938f5f9f636379402ba0bb9a53345de499f4f3fd50f232b31605129dcf4ea6c9')
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
}
