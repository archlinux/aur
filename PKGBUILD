# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=advancely
pkgname=$_pkgname
pkgver=1.0.13
pkgrel=1
pkgdesc="A highly customizable and interactive tool to track Minecraft progress beyond just Advancements."
arch=('x86_64')
url="https://github.com/LNXSeus/Advancely"
license=(LicenseRef-Proprietary)
depends=(sdl3 sdl3_image sdl3_ttf curl)
makedepends=(git cmake)
provides=(advancely)
conflicts=(advancely-bin advancely-git)
source=("git+$url#tag=v${pkgver}"
        "launcher"
        "advancely.png::https://raw.githubusercontent.com/LNXSeus/Advancely/refs/tags/v${pkgver}/packaging/linux/advancely.png"
        "advancely.desktop"
        "LICENSE::https://raw.githubusercontent.com/LNXSeus/Advancely/refs/tags/v${pkgver}/LICENSES.txt")
sha256sums=('504394b4dee6dd5a57c2481a58226ce3c4850991fd62ed391e72a756e1b61e1e'
            '47013c291c9b033bc6d5624d43ad78171c57b3dbf8f7ab39781a246381eaa8f5'
            '0bb1507a70774b586b1c40783e48653df9fd715b624196b87a106dbd347fda3c'
            '9318f61c7d6a31db2f9d435e15070e7d5e21e7de56a9a3fee923b763db23dbfa'
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
