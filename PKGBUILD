# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=membrane-soap
pkgver=1.3.1
pkgrel=1
pkgdesc="Generic SOAP client with a dynamic form generator for SOAP requests."
arch=('i686' 'x86_64')
url="http://www.membrane-soa.org/soap-client/"
license=('APACHE')
depends=('java-runtime' 'desktop-file-utils')
install="${pkgname}.install"
source=("http://mirror.predic8.com/membrane/client/linux-x86/membrane-client-linux.gtk.x86-${pkgver}.tar"
        "${pkgname}.desktop")
md5sums=('25a96915b83e3b6e7922c822a81abf0d'
         'fac69611ec1ae412cebac29545399c26')
if [ "$CARCH" = 'x86_64' ]; then
  source[0]="http://mirror.predic8.com/membrane/client/linux-x64/membrane-client-linux.gtk.x86_64-${pkgver}.tar"
  md5sums[0]='25a96915b83e3b6e7922c822a81abf0d'
fi

package() {
  # Install the desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # Copy all the required files
  if [ "$CARCH" = 'x86_64' ]; then
    cd "linux.gtk.x86_64"
  else
    cd "linux.gtk.x86"
  fi
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r configuration plugins membrane-client membrane-client.ini "${pkgdir}/usr/lib/${pkgname}"
  # Create the symbolic link to the executable
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/membrane-client" "${pkgdir}/usr/bin/${pkgname}"
  # Install the icon
  unzip -q -o -j plugins/com.predic8.rcp.membrane_client_${pkgver}.jar "icons/logo32.png"
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 "logo32.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
