# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=datagrip
_pkgname=DataGrip
pkgver=2016.2.1
pkgrel=1
pkgdesc='Smart SQL Editor and Advanced Database Client Packed Together for Optimum Productivity'
arch=('i686' 'x86_64')
options=('!strip')
url="http://www.jetbrains.com/${pkgname}/"
license=('Commercial')
optdepends=('java-environment>=8: use system java'
            'java-runtime-common: use system java')
provides=('0xdbe' '0xdbe-eap')
conflicts=('0xdbe' '0xdbe-eap')
source=(https://download.jetbrains.com/$pkgname/${pkgname}-${pkgver}.tar.gz
        jetbrains-datagrip.desktop)
sha512sums=('03d62de42be8d1ac68b85050ad62a2c98cba6f317122759cdb6dd5c307b707364f54ec52c12c4016ad0f9fe4f92b1d6e24e3b8d464dad4bb17b550417314b5d5'
            '76b68a198e50c9c89ce3638b7a4dd1a53dbe902396d0c9af77beb9243fcf9c503694cce1063e9535b8bf3e6f1912b2aa80ecf58285abc42f947f60a7fc4fb1d9')

package() {
  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/

  cp -a ${srcdir}/${_pkgname}-${pkgver} $pkgdir/opt/${pkgname}
  # if using system java you may remove the bundled jre and save about 100M
  #rm -rf $pkgdir/opt/${pkgname}/jre

  ln -s /opt/$pkgname/bin/${pkgname}.sh $pkgdir/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/jetbrains-${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 "${pkgdir}/opt/${pkgname}/bin/product.png" "${pkgdir}/usr/share/pixmaps/product.png"
}
