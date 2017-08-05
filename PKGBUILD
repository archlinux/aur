# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-jotun'
pkgver=2.3.0.5
pkgrel=1
pkgdesc='Jotun is a hand—drawn action—exploration game set in Norse mythology.'
url='http://jotungame.com/'
license=('custom')
groups=('games' 'gog')
arch=('i686' 'x86_64')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "file://${pkgname//-/_}_${pkgver}.sh"
)
sha256sums=(
  '15730c6bddfb776b8c9bbde0439b8ba67c783f2d94457b8965b9d3d22b6d03a8'
  'c68e6416957174c6194b4d38d773b122a635a8e4579b69c995c8f2709cb77840'
  '7084d6e39774396e115fb5f9951cfd74ea16cf5610c2bff37cfc4cc831990bb0'
)

prepare() {
  find . -type d -exec chmod 755 {} \;
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/opt/${pkgname}/support/"
  install -d "${pkgdir}/usr/bin/"

  cp -r data/noarch/game/ "${pkgdir}/opt/${pkgname}/"

  install -D -m 755        \
    "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -D -m 755      \
    data/noarch/start.sh \
    "${pkgdir}/opt/${pkgname}/"
  install -D -m 755                     \
    data/noarch/support/*.{sh,shlib} -t \
    "${pkgdir}/opt/${pkgname}/support/"
  install -D -m 644                                   \
    'data/noarch/docs/End User License Agreement.txt' \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 644                \
    "data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -D -m 644                \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim: ts=2 sw=2 et:
