# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='gog-yooka-laylee-toybox'
pkgver=2.1.0.2
pkgrel=1
pkgdesc='Yooka-Laylee is an all-new open-world platformer from key creative talent behind the Banjo-Kazooie and Donkey Kong Country games!'
url='http://www.playtonicgames.com/games/yooka-laylee/'
license=('custom')
arch=('i686' 'x86_64')
optdepends=('firejail: Automatically sandbox this application from your OS')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "file://${pkgname//-/_}_${pkgver}.sh"
)
sha256sums=(
  'c38bcc24125f6fa9b9406ee7b8cc536a0c238ab36a1cf34a8e5478dac897e80e'
  '8574e2463800004ddf97e49d2760d834413bf51fda4b1a57ead8cc10b07ac4f2'
  '3825f83b9fc43466e84b052b4e087498d8ce3103d0fca08c6d9e56131de05c84'
)

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
