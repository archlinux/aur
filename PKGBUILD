# Maintainer: Stanislav Nikitin <pztrn at pztrn dot name>

pkgname=nxmc
pkgver=2.2.16
pkgrel=1
pkgdesc="Graphical console for NetXMS NMS based on Eclipse."
arch=('x86_64' 'i686')
url="https://www.netxms.org/"
license=('custom')
depends=(gtk3 python cairo jre8-openjdk)
makedepends=(imagemagick)
source_x86_64=(https://www.netxms.org/download/releases/2.2/${pkgver}/${pkgname}-${pkgver}-linux-gtk-x64.tar.gz
               ${pkgname}.desktop
               https://raw.githubusercontent.com/netxms/netxms/master/COPYING
)
source_i686=(https://www.netxms.org/download/releases/2.2/${pkgver}/${pkgname}-${pkgver}-linux-gtk-x86.tar.gz
               ${pkgname}.desktop
               https://raw.githubusercontent.com/netxms/netxms/master/COPYING
)
sha256sums_x86_64=('fd7dbdd71385b2cbe57a6d4ab1770ec69dd1c08f18ae85e7b53e9b7269c7924d'
                   'a8fd91020c07d78163bcc4988ab94ca192240bb01566138cc6ed531e3d183e9c'
                   '61406472f600746e836e92a47baa290a4a2f8491ac09724bc5bf2a0a4a5309e3')
sha256sums_i686=('fa11b2cf27253b727932cc4c3d429eca5874fafd4ba4ed927f838d2707a30d9e'
                 'a8fd91020c07d78163bcc4988ab94ca192240bb01566138cc6ed531e3d183e9c'
                 '61406472f600746e836e92a47baa290a4a2f8491ac09724bc5bf2a0a4a5309e3')
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
  ln -s /opt/${_pkgname}/bin/nxmc "${pkgdir}"/usr/bin/nxmc
}
