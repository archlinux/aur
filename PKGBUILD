# Maintainer : David Roheim <david.roheim@gmail.com>

pkgname=zendstudio
pkgver=13.6.0
pkgrel=1
pkgdesc="ZendStudio is the leading PHP IDE for development"
arch=('x86_64')
url="http://www.zend.com/en/products/studio/"
depends=('java-environment' 'gtk2' 'unzip' 'libwebkit' 'libxtst' 'svnkit' 'mariadb-clients')
install=${pkgname}.install
license=("Custom")
options=(!strip)
makedepends=('zip')
source=("http://downloads.zend.com/studio-eclipse/${pkgver}/ZendStudio-${pkgver}-linux.gtk.x86_64.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.png")





sha512sums=('eee9c54d553ab7cc2a0a0f7ef670771519203180a0cd92a88826fd89ae0da8311e118e55848843a5e94f0c2a90c967ea2bacfe7ef842bee51a38c6283ceff9f4'
            '44486ea5e1cde93386fc784a9c2d27c0c82ed45bf8cc9ecd295b575c20175f1136ef0bc4cb3fe66860ffba648e55d1c61ca848733f19f4bc82fe5d26abd06180'
            '632101dea14d3950d87edb11d26940f12dd73d39c76039f7f2046ac18c27b67eab25dafc3f2210f270ae82bb8bf6076eafbdf7ba33e964e13a6515c6bdcfb8cf'
            'dcab260c1bf7f918c9912a0e8416d78fdfeb6717c40bc1c7f846e81877814ca8e6fd95e62911d025e6589d01fb4d648caa338046231954edaa36d6a71a8df227')

build() {
 true
}

package() {
  install -m755 -d ${pkgdir}/usr/share
  mv ZendStudio ${pkgdir}/usr/share/${pkgname}

  install -m755 -d ${pkgdir}/usr/bin
  install -m755 ${pkgname}.sh $pkgdir/usr/bin/${pkgname}

  install -m755 -d ${pkgdir}/usr/share/applications
  install -m644 ${pkgname}.desktop $pkgdir/usr/share/applications/

  install -m755 -d ${pkgdir}/usr/share/icons/hicolor/64x64/apps
  cp ${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
  chmod 644 ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
  
  sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|" ${pkgdir}/usr/share/${pkgname}/plugins/org.apache.ant_1.9.6.v201510161327/bin/runant.py
}

