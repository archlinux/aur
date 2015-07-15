# Maintainer: Damien Guihal <dguihal@gmail.com>
pkgname=soapui
pkgver=5.2.0
pkgrel=1
pkgdesc="A graphical Java program for inspecting, invoking, monitoring, simulating/mocking and functional/load/compliance/surveillance testing of REST/WADL and SOAP/WSDL-based Web Services over HTTP."
arch=('i686' 'x86_64')
url="http://www.soapui.org/"
license=('EUPL V.1.1')
groups=()
depends=('java-environment' 'hicolor-icon-theme')
source=("http://cdn01.downloads.smartbear.com/soapui/$pkgver/SoapUI-$pkgver-linux-bin.tar.gz"
        "http://freeapps.co.uk.s3.amazonaws.com/images/thumbnails/$pkgname.png"
        "$pkgname.desktop"
        "$pkgname")
#generate with 'makepkg -g'
md5sums=('a76d98de17cadd7073a70e4db635c980'
         '3cc08aca62edb502fc53013edf69f640'
         'f0e2fa73dd9a7c271e38c179b4e284a3'
         '46e71776148c5f043ead3b2648e6f575')
sha1sums=('11faca78357dce9942ea8c30172cfb6c26891e7c'
          '9f12e2f0db63083a3fa4e5b6fdfd10c8dfd038c0'
          '4ced7d28c3c5880db600bf4769fdb1a3dc3a6fce'
          '9c5648b9453935f4a5dd633ccd8ea32541fabb95')

build() {
  cd ${srcdir}/SoapUI-$pkgver

  #Correction du bug jxplorer
  sed -i -e 's/^java/${JAVA_HOME}\/bin\/java/' bin/soapui.sh
}

package() {
  mkdir -p ${pkgdir}/usr/share/soapui
  mkdir -p ${pkgdir}/usr/bin
  cd ${srcdir}/SoapUI-$pkgver
  cp -R * ${pkgdir}/usr/share/soapui

  cd ${srcdir}
  install $pkgname.desktop -m 0644 -D ${pkgdir}/usr/share/applications/$pkgname.desktop
  install $pkgname.png -m 0644 -D ${pkgdir}/usr/share/icons/hicolor/48x48/apps/$pkgname.png
  install $pkgname -m 0755 -D ${pkgdir}/usr/bin/soapui
  chmod 0755 ${pkgdir}/usr/share/soapui/bin/soapui.sh

  cd ${pkgdir}/usr/share/soapui
  ln -sf bin/starter-page.html .
}

# vim:set ts=2 sw=2 et:

