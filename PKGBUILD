# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=membrane-soap
pkgver=1.3.1
pkgrel=2
pkgdesc="Generic SOAP client with a dynamic form generator for SOAP requests."
arch=('x86_64')
url="https://github.com/membrane/client"
license=('APACHE')
makedepends=('unzip')
depends=('java-runtime' 'desktop-file-utils')
source=("http://url.muflone.com/membrane-client-linux.gtk.x86_64-${pkgver}.tar"
        "${pkgname}.desktop")
sha256sums=('12b981a3b773879fab8345bea279e553a33079ea226976146c5ed001e7cf27e7'
            '1ec31aea2471f17b95b0512f3c80d510132bedca15878696e67094b3fe9fe173')

package() {
  # Install the desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # Copy all the required files
  cd "linux.gtk.x86_64"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r "configuration" "plugins" "membrane-client" "membrane-client.ini" "${pkgdir}/usr/lib/${pkgname}"
  # Create the symbolic link to the executable
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/membrane-client" "${pkgdir}/usr/bin/${pkgname}"
  # Install the icon
  unzip -q -o -j plugins/com.predic8.rcp.membrane_client_${pkgver}.jar "icons/logo32.png"
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 "logo32.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
