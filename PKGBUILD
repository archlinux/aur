# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-west-of-loathing'
pkgver=1.0.3
pkgrel=1
pkgdesc='Say howdy to West of Loathing -- a single-player slapstick comedy adventure role-playing game set in the wild west of the Kingdom of Loathing universe.'
url='http://westofloathing.com/'
license=('custom')
groups=('games' 'gog')
arch=('x86_64')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  'file://west_of_loathing_en_1_0_3_16426.sh'
)
sha256sums=(
  '8125c647c046682ffa7738e1218f67b8d67662f7057b27eccc1fc1a6fb94aca9'
  '8b94a2a0a277bb91522476d723a80c0e1a075b36e87b9a770cdea9f7bf9ea21e'
  '02965e6a96b46004060c20bf6a14c334c256dc4e178e9d1d4fad8f9db9fba213'
)

prepare() {
  find . -type d -exec chmod 755 {} \;
}

package() {
  install -d "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/opt/${pkgname}/support/"
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/pixmaps/"

  cp -r data/noarch/game "${pkgdir}/opt/${pkgname}/"

  install -m 755           \
    "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -m 644         \
    data/noarch/gameinfo \
    "${pkgdir}/opt/${pkgname}/"
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
