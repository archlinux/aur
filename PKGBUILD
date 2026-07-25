# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=advancely
pkgname=$_pkgname-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="A highly customizable and interactive tool to track Minecraft progress beyond just Advancements."
arch=('x86_64')
url="https://github.com/LNXSeus/Advancely"
license=(LicenseRef-Proprietary)
depends=(unzip sdl3 sdl3_image sdl3_ttf curl)
provides=(advancely)
conflicts=(advancely advancely-git)
source=("Advancely.zip::$url/releases/download/v${pkgver}/Advancely-v${pkgver}-Linux.zip"
        "launcher::https://raw.githubusercontent.com/LNXSeus/Advancely/refs/tags/v${pkgver}/packaging/linux/launcher"
        "advancely.png::https://raw.githubusercontent.com/LNXSeus/Advancely/refs/tags/v${pkgver}/packaging/linux/advancely.png"
        "advancely.desktop::https://raw.githubusercontent.com/LNXSeus/Advancely/refs/tags/v${pkgver}/packaging/linux/advancely.desktop"
        "LICENSE::https://raw.githubusercontent.com/LNXSeus/Advancely/refs/tags/v${pkgver}/LICENSES.txt")
sha256sums=('a48962ed268e9ee4a0fc6dc2beabfdd3f33e08fda215988269f150a6881cdab3'
            '4c81cb62b84ff3698f9b4102f3d382e8bc678e1ca09289a33e815d7736912098'
            '0bb1507a70774b586b1c40783e48653df9fd715b624196b87a106dbd347fda3c'
            '8bb22822a63455292196566532618d1aca55b929de1ec5405c5db2d08f83421e'
            'fff9ea96fc01424bada8be2f6d2895a2cc2488fae1d9a40a9b8849d8cb294b7e')

prepare() {
  echo $pkgver > version
  unzip Advancely.zip -d sources
}

package() {
  mkdir -p "${pkgdir}/usr/share/${_pkgname}"
  cp -r sources/resources "${pkgdir}/usr/share/${_pkgname}/"

  install -D -m 755 "sources/Advancely" "${pkgdir}/usr/share/${_pkgname}"

  install -D -m 755 "launcher" "${pkgdir}/usr/bin/advancely"

  install -D -m 644 "advancely.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -D -m 755 "advancely.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -D -m 644 "version" "${pkgdir}/usr/share/${_pkgname}/version"
  install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
