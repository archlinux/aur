# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=advancely
pkgname=$_pkgname-bin
pkgver=1.0.15
pkgrel=2
pkgdesc="A highly customizable and interactive tool to track Minecraft progress beyond just Advancements."
arch=('x86_64')
url="https://github.com/DFA-G/Advancely"
license=(LicenseRef-Proprietary)
depends=(unzip sdl3 sdl3_image sdl3_ttf curl)
provides=(advancely)
conflicts=(advancely advancely-git)
source=("Advancely.zip::$url/releases/download/v${pkgver}/Advancely-v${pkgver}-Linux.zip"
        "launcher::https://raw.githubusercontent.com/DFA-G/Advancely/refs/tags/v${pkgver}/packaging/linux/launcher"
        "advancely.png::https://raw.githubusercontent.com/DFA-G/Advancely/refs/tags/v${pkgver}/packaging/linux/advancely.png"
        "advancely.desktop::https://raw.githubusercontent.com/DFA-G/Advancely/refs/tags/v${pkgver}/packaging/linux/advancely.desktop"
        "LICENSE::https://raw.githubusercontent.com/DFA-G/Advancely/refs/tags/v${pkgver}/LICENSES.txt")
sha256sums=('0353df38514daf372fd24244d07c5b3925c302b7835f92181fde41ece4205a2c'
            '111527682cf029c30fd09250c494cee576b88b487e29fe0f6a179cc82d378133'
            '0bb1507a70774b586b1c40783e48653df9fd715b624196b87a106dbd347fda3c'
            '9318f61c7d6a31db2f9d435e15070e7d5e21e7de56a9a3fee923b763db23dbfa'
            'f14cf9ae123aa2d5bd975b8766adba9dbe41ac736ff7022b27349cd795970140')

prepare() {
  echo $pkgver > version
  unzip Advancely.zip -d sources
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
