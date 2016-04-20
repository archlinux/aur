# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=datagrip
_pkgname=DataGrip
pkgver=2016.1
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
        jetbrains-datagrip.desktop
        datagrip.sh)
sha256sums=('9bd8a78ff5ad8344dbd111bf3a48a277f71fd8a8347d3fb9a1c09af4320eb9e3'
            '60624032f3952952e31d0ccd0eec9c602b6612ad204b5d6ee0f35152a4e219eb'
            '43c1a922107c352d83a7b7f718f014a6e9e769dc2da0ea25813e0677fa035844')

package() {
  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/
  install -d -m 755 ${pkgdir}/etc/profile.d/

  cp -a ${srcdir}/${_pkgname}-${pkgver} $pkgdir/opt/${pkgname}
  # if using system java you may remove the bundled jre and save about 100M
  #rm -rf $pkgdir/opt/${pkgname}/jre

  ln -s /opt/$pkgname/bin/${pkgname}.sh $pkgdir/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/jetbrains-${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d/
  install -D -m 644 "${pkgdir}/opt/${pkgname}/bin/product.png" "${pkgdir}/usr/share/pixmaps/product.png"
}
