# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=hboxc
pkgver=0.0.13
pkgrel=1
pkgdesc='Virtual Infrastructure Manager for VirtualBox - Client'
arch=('x86_64')
url='https://kamax.io/hbox/'
license=('GPL3')
depends=('java-runtime>=7' 'bash')
source=("https://github.com/hyperbox/hyperbox/releases/download/${pkgver}/hbox-${pkgver}-linux_amd64-client.zip")
sha256sums=('08a7363c5334ff44053462324983a53d7e605e72ffdad078276fbcf4a11372c1')

package() {
  cd "${srcdir}"

  # copy package files
  install -d -m755 "${pkgdir}/opt/hboxc"
  cp -r bin doc hyperbox icons modules lib "${pkgdir}/opt/hboxc"
  chmod 755 "${pkgdir}/opt/hboxc/hyperbox"

  # create the start script in /usr/bin
  install -d -m755 "${pkgdir}/usr/bin"
  sed 's|export HBOX_CLIENT_BASE_DIR=.*|export HBOX_CLIENT_BASE_DIR=/opt/hboxc|' hyperbox > "${pkgdir}/usr/bin/hboxc"
  chmod 755 "${pkgdir}/usr/bin/hboxc"

  # add shortcut stuff
  install -D -m644 hyperbox-client.desktop "${pkgdir}/usr/share/applications/hyperbox-client.desktop"
  echo "Path=/opt/hboxc" >> "${pkgdir}/usr/share/applications/hyperbox-client.desktop"
  echo "Exec=/opt/hboxc/hyperbox" >> "${pkgdir}/usr/share/applications/hyperbox-client.desktop"
  echo "Icon=/opt/hboxc/icons/hyperbox.ico" >> "${pkgdir}/usr/share/applications/hyperbox-client.desktop"

  # add license
  install -D -m644 doc/manual/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
