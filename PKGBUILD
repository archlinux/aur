# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-yooka-laylee'
pkgver=2.1.0.2
pkgrel=1
pkgdesc="Yooka-Laylee is an all-new open-world platformer from key creative talent behind the Banjo-Kazooie and Donkey Kong Country games!"
url="http://www.playtonicgames.com/games/yooka-laylee/"
license=('custom')
arch=('i686' 'x86_64')
makedepends=('p7zip')
optdepends=(
  'firejail: Automatically sandbox this application from your OS'
)
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "${pkgname}.profile"
  "file://${pkgname//-/_}_${pkgver}.sh"
)
sha256sums=(
  '4e4c5428a1d929007fea2204b688a4dcd97a13c992b5f92a0c7866f11adc8adc'
  'eab3d609d3146cb69b32e9b9c894164323c3eab45628a33e9d1e6e75cd9ebbca'
  '45d542985620e05d6e60f52e3e9b348870f79b328cc118ff9bd5769e9fed5585'
  '4196857a89078b834a2ae0a64785246951f899cbe1629089ad332fd48fdf794c'
)

prepare() {
  7z x "${pkgname//-/_}_${pkgver}.sh" -tzip -y
}

package() {
  install -d "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/opt/${pkgname}/support/"
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/pixmaps/"

  cp -r data/noarch/game "${pkgdir}/opt/${pkgname}/"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;

  install -m 755           \
    "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -m 755         \
    data/noarch/start.sh \
    "${pkgdir}/opt/${pkgname}/"
  install -m 755                     \
    data/noarch/support/*.{sh,shlib} \
    "${pkgdir}/opt/${pkgname}/support/"
  install -m 644                                      \
    'data/noarch/docs/End User License Agreement.txt' \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644                   \
    "data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m 644                   \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim: ts=2 sw=2 et:
