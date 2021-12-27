# Maintainer: William Turner <willtur.will@gmail.com>
_name=hyperbox
pkgname=hboxc
pkgver=0.0.17
pkgrel=1
pkgdesc="Virtual Infrastructure Manager for VirtualBox - Client"
arch=('x86_64')
url='https://kamax.io/hbox/'
license=('GPL3')
depends=('java-runtime>=8')
source=("https://github.com/hyperbox/${_name}/releases/download/v${pkgver}/hbox-client-${pkgver}-linux.zip")
sha256sums=('8e01b7f057f192016d23d033fc0102acd9d9d28f90fe152b1712a0839a406551')

package() {
  # copy package files
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  cp -r bin icons lib "${pkgdir}/opt/${pkgname}/"

  # Installed patched launch script
  sed "s;HBOX_CLIENT_BASE_DIR=.*;HBOX_CLIENT_BASE_DIR=/opt/${pkgname};" hyperbox > "${pkgdir}/opt/${pkgname}/hyperbox"
  chmod 755 "${pkgdir}/opt/${pkgname}/hyperbox"

  # Add symlinks in path
  install -d -m755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/hyperbox" "${pkgdir}/usr/bin/hyperbox"
  ln -s "/opt/${pkgname}/hyperbox" "${pkgdir}/usr/bin/hboxc"

  # add shortcut stuff
  install -D -m644 hyperbox-client.desktop "${pkgdir}/usr/share/applications/hyperbox-client.desktop"
  echo "Path=/opt/${pkgname}" >> "${pkgdir}/usr/share/applications/hyperbox-client.desktop"
  echo "Exec=/opt/${pkgname}/hyperbox" >> "${pkgdir}/usr/share/applications/hyperbox-client.desktop"
  echo "Icon=/opt/${pkgname}/icons/hyperbox.ico" >> "${pkgdir}/usr/share/applications/hyperbox-client.desktop"
}
