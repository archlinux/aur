# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=advancely
pkgname=$_pkgname
pkgver=1.0.15
pkgrel=1
pkgdesc="A highly customizable and interactive tool to track Minecraft progress beyond just Advancements."
arch=('x86_64')
url="https://github.com/DFA-G/Advancely"
license=(LicenseRef-Proprietary)
depends=(sdl3 sdl3_image sdl3_ttf curl)
makedepends=(git cmake)
provides=(advancely)
conflicts=(advancely-bin advancely-git)
source=("git+$url#tag=v${pkgver}"
        "launcher::https://raw.githubusercontent.com/DFA-G/Advancely/refs/tags/v${pkgver}/packaging/linux/launcher"
        "advancely.png::https://raw.githubusercontent.com/DFA-G/Advancely/refs/tags/v${pkgver}/packaging/linux/advancely.png"
        "advancely.desktop::https://raw.githubusercontent.com/DFA-G/Advancely/refs/tags/v${pkgver}/packaging/linux/advancely.desktop"
        "LICENSE::https://raw.githubusercontent.com/DFA-G/Advancely/refs/tags/v${pkgver}/LICENSES.txt")
sha256sums=('61feacc891b8b390dd13e74fcbadf087620c5a781c6113cf52aed3fef5b9b75f'
            '111527682cf029c30fd09250c494cee576b88b487e29fe0f6a179cc82d378133'
            '0bb1507a70774b586b1c40783e48653df9fd715b624196b87a106dbd347fda3c'
            '8bb22822a63455292196566532618d1aca55b929de1ec5405c5db2d08f83421e'
            'f14cf9ae123aa2d5bd975b8766adba9dbe41ac736ff7022b27349cd795970140')

build() {
  cd "$srcdir/Advancely"

  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
}

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/advancely"

  install -D -m 644 "advancely.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -D -m 755 "advancely.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "$srcdir/Advancely"

  mkdir -p "${pkgdir}/usr/share/${_pkgname}"

  install -D -m 755 "build/Advancely" "${pkgdir}/usr/share/${_pkgname}/Advancely"
  cp -r resources "${pkgdir}/usr/share/${_pkgname}/"
}
