# Maintainer:  Courtney Swagar <distorto@member.fsf.org>

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-hypnospace-outlaw'
pkgver=2.34b
pkgrel=1
pkgdesc='Solve crimes on the 90s internet'
url='http://www.hypnospace.net/'
license=('custom')
groups=('games' 'gog')
arch=('x86_64')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  'file://hypnospace_outlaw_2_34b_linux64_46295.sh'
)
sha256sums=(
  '9fcb50a4e213fe1a209221ab9ac99392b8be805cfe5966ea17d8e5e6f640c8e7'
  '395fb7e8199cbe728a6bae36cb608f4273921a1100f07f85a0147034fe3118b3'
  '841a7d16329a8e808177aaf98e75c0120fcfe7772ff1472134d894e93dd77ae1'
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
