# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=advancely
pkgname=$_pkgname-bin
pkgver=1.3.0
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
sha256sums=('6a58efaa3e032e1d4e8f1627a0ef06012e2feb7b9e3985ac78f3ae680d6c6383'
            '673543fe55a6aae685bb2b3814e4678365330621acab21b730b38042bab32426'
            '0bb1507a70774b586b1c40783e48653df9fd715b624196b87a106dbd347fda3c'
            '8bb22822a63455292196566532618d1aca55b929de1ec5405c5db2d08f83421e'
            '8f272e6392c75366b929c55703e119733d62101daedc04d57fcec32ac051d098')

prepare() {
  echo $pkgver > version
  unzip Advancely.zip -d sources
}

package() {
  mkdir -p "${pkgdir}/usr/share/${_pkgname}"
  cp -r sources/resources "${pkgdir}/usr/share/${_pkgname}/"

  install -D -m 755 "sources/Advancely" "${pkgdir}/usr/share/Advancely"

  install -D -m 755 "launcher" "${pkgdir}/usr/bin/advancely"

  install -D -m 644 "advancely.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -D -m 755 "advancely.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -D -m 644 "version" "${pkgdir}/usr/share/${_pkgname}/version"
  install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
