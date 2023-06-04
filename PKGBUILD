# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: ronny <ronny63@gmail.com>
# Contributor: Massimiliano Brocchini <proc80@gmail.com>

pkgname=rainlendar-pro
pkgver=2.19.2
pkgrel=2
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('gtk2' 'libcanberra' 'libsm')
provides=('rainlendar2')
conflicts=('rainlendar-lite')
source=("https://www.rainlendar.net/download/${pkgver}/Rainlendar-Pro-${pkgver}-amd64.tar.bz2"
        "${pkgname}.png")
sha256sums=('6fbf474f55b701a1bfec3e566f55424575ae63661a7811f6935e310aaef0ba3b'
            '40d4abb23dec339a2ab7b1ef1a6f99de158aff2997e5cadbe1c10d5b10e1e7f3')

package() {
  install -d "${pkgdir}"/{opt,usr/bin,usr/share/licenses/${pkgname}}

  gendesk -f -n --pkgname "${pkgname}" \
    --name "Rainlendar Pro" \
    --genericname "Desktop Calendar" \
    --pkgdesc "Rainlendar Pro Desktop Calendar" \
    --categories "Utility" \
    --exec "rainlendar" \
    --icon "${pkgname}"

  cp -R "${srcdir}"/rainlendar2 "${pkgdir}"/opt
  ln -s /opt/rainlendar2/rainlendar2 "${pkgdir}"/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m 644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -D -m 644 ${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
}
