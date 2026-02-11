# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=advancely
pkgname=$_pkgname-bin
pkgver=1.0.13
pkgrel=2
pkgdesc="A highly customizable and interactive tool to track Minecraft progress beyond just Advancements."
arch=('x86_64')
url="https://github.com/LNXSeus/Advancely"
license=(LicenseRef-Proprietary)
depends=(unzip sdl3 sdl3_image sdl3_ttf curl)
provides=(advancely)
conflicts=(advancely advancely-git)
source=("Advancely.zip::$url/releases/download/v${pkgver}/Advancely-v${pkgver}-Linux.zip"
        "launcher"
        "https://raw.githubusercontent.com/LNXSeus/Advancely/refs/tags/v${pkgver}/packaging/linux/advancely.png"
        "advancely.desktop"
        "LICENSE::https://raw.githubusercontent.com/LNXSeus/Advancely/refs/tags/v${pkgver}/LICENSES.txt")
sha256sums=('4a1893b67dcc53756f4891500dc6b1d00573e95073377421451f26b1ac4b99cd'
            '47013c291c9b033bc6d5624d43ad78171c57b3dbf8f7ab39781a246381eaa8f5'
            '0bb1507a70774b586b1c40783e48653df9fd715b624196b87a106dbd347fda3c'
            '9318f61c7d6a31db2f9d435e15070e7d5e21e7de56a9a3fee923b763db23dbfa'
            'f14cf9ae123aa2d5bd975b8766adba9dbe41ac736ff7022b27349cd795970140')

prepare() {
  echo $pkgver > version
  unzip Advancely.zip -d sources
  rm "sources/_PLEASE_READ_ME.txt" "sources/LICENSES.txt" "sources/README.md" sources/*.so.0
}

package() {
  mkdir -p "${pkgdir}/usr/share/${_pkgname}"
  cp -r sources/* "${pkgdir}/usr/share/${_pkgname}/"

  install -D -m 755 "launcher" "${pkgdir}/usr/bin/advancely"

  install -D -m 644 "advancely.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -D -m 755 "advancely.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -D -m 644 "version" "${pkgdir}/usr/share/${_pkgname}/version"
  install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
