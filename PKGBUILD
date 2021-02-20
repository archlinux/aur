# Maintainer: Stanislav Nikitin <pztrn at pztrn dot name>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=nxmc
pkgver=3.8.120
pkgrel=1
pkgdesc="Graphical console for NetXMS NMS based on Eclipse."
arch=('x86_64')
url="https://www.netxms.org/"
license=('custom')
depends=(gtk3 python cairo jre-openjdk)
makedepends=(imagemagick)
source=(https://netxms.org/download/releases/3.8/${pkgname}-${pkgver}-linux-gtk-x64.tar.gz
        ${pkgname}.desktop
        https://raw.githubusercontent.com/netxms/netxms/master/COPYING
        ${pkgname}.sh
)
sha256sums=('eedbf99895ac63e59d4447ff2d99ec2ff246875cbb52f718adfc550aff8aa16e'
            '5fa1476cf864854db813597aac7d52d140218254cbfe4cc44b6ef3858a751675'
            '9ac6daa129fb98672b5bc6bd6d2283a7b419b1186d298c5aeb3156bf317228ab'
            '132b00293931b62bb99990991a817b72d3110a64f3142e3c2e453ef112c9d9d4')

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"

  install -m644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  /usr/bin/convert "${srcdir}/${pkgname}/icon.xpm" "${srcdir}/${pkgname}/icon.png"
  install -m644 "${srcdir}/${pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  cp -r "${srcdir}/${pkgname}/"* "${pkgdir}/opt/${pkgname}" -R
  install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/nxmc"
}
