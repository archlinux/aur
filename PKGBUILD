# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-jotun'
pkgver=2.2.0.4
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
  'ea53d18d79f40bd56dff587a995af9b56bf71593c49a02e4e4923b434fc678e8'
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
