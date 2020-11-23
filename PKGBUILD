# Maintainer: Stanislav Nikitin <pztrn at pztrn dot name>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=nxmc
pkgver=3.6.252
pkgrel=1
pkgdesc="Graphical console for NetXMS NMS based on Eclipse."
arch=('x86_64')
url="https://www.netxms.org/"
license=('custom')
depends=(gtk3 python cairo jre-openjdk)
makedepends=(imagemagick)
source=(https://netxms.org/download/releases/3.6/${pkgname}-${pkgver}-linux-gtk-x64.tar.gz
        ${pkgname}.desktop
        https://raw.githubusercontent.com/netxms/netxms/master/COPYING
)
sha256sums=('17d945da890a34f985ebc8069ce81433f6628ceaf3986f2fc3e655afec961faa'
            'a8fd91020c07d78163bcc4988ab94ca192240bb01566138cc6ed531e3d183e9c'
            '9ac6daa129fb98672b5bc6bd6d2283a7b419b1186d298c5aeb3156bf317228ab')
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
