# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: ronny <ronny63@gmail.com>
# Contributor: Massimiliano Brocchini <proc80@gmail.com>

pkgname=rainlendar-pro
pkgver=2.20.1
pkgrel=1
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('gtk2' 'libcanberra' 'libsm')
makedepends=('gendesk')
provides=('rainlendar2')
conflicts=('rainlendar-lite')
source=("https://www.rainlendar.net/download/${pkgver}/Rainlendar-Pro-${pkgver}-amd64.tar.bz2"
        "${pkgname}.png")
sha256sums=('dfcd93eed7ce3f1fbf634bc96074d802f89ff9829c85169b4b60b654a14688b7'
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
