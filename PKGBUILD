# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-jotun'
pkgver='20190430_29317'
pkgrel=1
pkgdesc='Jotun is a hand—drawn action—exploration game set in Norse mythology.'
url='http://jotungame.com/'
license=('custom')
groups=('games' 'gog')
arch=('i686' 'x86_64')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "file://jotun_${pkgver}.sh"
)
sha256sums=(
  '8a99b6c941c309af11a3d251280562d0729dad74667dabe5d654530aa9064410'
  'c68e6416957174c6194b4d38d773b122a635a8e4579b69c995c8f2709cb77840'
  '0ca6c3941e0bec757c4b2306f1800fa7591b5305520025ab34646adbaf828912'
)

package() {
  install -d "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/opt/${pkgname}/support/"
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/pixmaps/"

  cp -r data/noarch/game/ "${pkgdir}/opt/${pkgname}/"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;

  install -m 755           \
    "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -m 755         \
    data/noarch/start.sh \
    "${pkgdir}/opt/${pkgname}/"
  install -m 755         \
    data/noarch/gameinfo \
    "${pkgdir}/opt/${pkgname}/"
  install -m 755                        \
    data/noarch/support/*.{sh,shlib} -t \
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
