# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Stanislav Nikitin <pztrn at pztrn dot name>

pkgname=nxmc
pkgver=3.3.314
pkgrel=1
pkgdesc="Graphical console for NetXMS NMS based on Eclipse."
arch=('x86_64')
url="https://www.netxms.org/"
license=('custom')
depends=(gtk3 python cairo jre8-openjdk)
makedepends=(imagemagick)
source=(https://www.netxms.org/download/releases/3.3/${pkgname}-${pkgver}-linux-gtk-x64.tar.gz
        ${pkgname}.desktop
        https://raw.githubusercontent.com/netxms/netxms/master/COPYING
)
sha256sums=('b711001e1823a10f854aea1265702eef25cfbafa16dec51abd9277746e033120'
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
