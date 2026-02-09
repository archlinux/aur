# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=advancely
pkgname=$_pkgname-bin
pkgver=1.0.13
pkgrel=1
pkgdesc="A highly customizable and interactive tool to track Minecraft progress beyond just Advancements."
arch=('x86_64')
url="https://github.com/LNXSeus/Advancely"
license=(LicenseRef-Proprietary)
depends=(unzip sdl3 sdl3_image sdl3_ttf curl)
source=("Advancely.zip::$url/releases/download/v${pkgver}/Advancely-v${pkgver}-Linux.zip"
        "launcher"
        "https://raw.githubusercontent.com/LNXSeus/Advancely/refs/tags/v${pkgver}/packaging/linux/advancely.png"
        "advancely.desktop"
        "LICENSE")
sha256sums=('4a1893b67dcc53756f4891500dc6b1d00573e95073377421451f26b1ac4b99cd'
            'f1ebe29085984bac0719a8ab7a911075208ea189e3b0c3b6c40179f7df54f80c'
            '0bb1507a70774b586b1c40783e48653df9fd715b624196b87a106dbd347fda3c'
            '8bb22822a63455292196566532618d1aca55b929de1ec5405c5db2d08f83421e'
            '7c18cf9f6781c08003aa13fe9ce08ebdf9b54f61fc806d77d29a51e925142b36')

prepare() {
  unzip Advancely.zip -d sources
  rm "sources/_PLEASE_READ_ME.txt" "sources/LICENSES.txt" "sources/README.md"
}

package() {
  mkdir -p "${pkgdir}/usr/share/${_pkgname}"
  cp -r sources/* "${pkgdir}/usr/share/${_pkgname}/"

  install -D -m 755 "launcher" "${pkgdir}/usr/bin/advancely"

  install -D -m 644 "advancely.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -D -m 755 "advancely.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
