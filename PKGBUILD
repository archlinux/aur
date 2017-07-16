# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-owlboy'
pkgver=2.2.0.3
pkgrel=1
pkgdesc="Owlboy is a 'hi-bit' adventure game, where you can fly and explore a brand new world in the clouds!"
url="http://www.owlboygame.com/"
license=('custom')
arch=('i686' 'x86_64')
optdepends=(
  'firejail: Automatically sandbox this application from your OS'
)
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "file://${pkgname//-/_}_${pkgver}.sh"
)
sha256sums=(
  '160b4d0fb275d3c1d4d6d574ca4085579e944e67dd32bd0a0c6e79f2e3d105a6'
  '8574e2463800004ddf97e49d2760d834413bf51fda4b1a57ead8cc10b07ac4f2'
  '41cc985f9399bb59a4da78a0ffbeae9d8ec7fda8dee3f409b93c9d978a8f8562'
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
