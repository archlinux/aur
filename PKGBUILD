# Maintainer: Stanislav Nikitin <pztrn at pztrn dot name>

pkgname=nxmc
pkgver=2.2.12
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
sha256sums_x86_64=('c37e3765c8859fbffdfaee0beeda1a3e583ed3390a245f72b44e7164412dc8f4'
                   'a8fd91020c07d78163bcc4988ab94ca192240bb01566138cc6ed531e3d183e9c'
                   '61406472f600746e836e92a47baa290a4a2f8491ac09724bc5bf2a0a4a5309e3')
sha256sums_i686=('00267fdd5349691a6426d44f17dc8e8784f2c6841de63b9ebd4f895b31486685'
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
