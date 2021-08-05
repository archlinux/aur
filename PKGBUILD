# Maintainer:  Tyler Swagar <distorto@member.fsf.org>

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-hypnospace-outlaw'
pkgver=2.25e
pkgrel=1
pkgdesc='Solve crimes on the 90s internet'
url='http://www.hypnospace.net/'
license=('custom')
groups=('games' 'gog')
arch=('x86_64')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  'file://hypnospace_outlaw_2_25e_linux64_40816.sh'
)
sha256sums=(
  '9fcb50a4e213fe1a209221ab9ac99392b8be805cfe5966ea17d8e5e6f640c8e7'
  '395fb7e8199cbe728a6bae36cb608f4273921a1100f07f85a0147034fe3118b3'
  '615a68ab2f5a35f1f52c4d132366ba3ae2ca05bf829c148cc7a9bf41489e8f46'
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
