# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Gino Pezzin <pezzin@gmail.com>
pkgname=tn5250j
pkgver=0.7.5
pkgrel=1
pkgdesc="5250 terminal emulator for iSeries and AS/400 written in Java"
url="http://tn5250j.sourceforge.net/"
arch=('any')
license=('GPL')
depends=('bash' 'java-runtime' 'hicolor-icon-theme' 'gtk-update-icon-cache' 'desktop-file-utils')
optdepends=('tn5250j-plugin-itext: to convert the spool texts in PDF'
            'tn5250j-plugin-jtopen: to export spool and data files'
            'tn5250j-plugin-jython: to execute Python scripts inside tn5250j'
            'tn5250j-plugin-kunststoff: to apply the Kunststoff look and feel'
            'tn5250j-plugin-log4j: to enable a more detailed logging'
            'tn5250j-plugin-mail: to send email messages for exported data or screenshots')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}-full-bin.zip"
        "${pkgname}.svg"::"http://sourceforge.net/p/${pkgname}/code/1229/tree/branches/new-tabs-jse1.6/resources/tn5250j-icon.svg?format=raw"
        "${pkgname}"
        "${pkgname}.desktop")
sha256sums=('158a16a16df46c97f76cfd6f70ed2d37b0c9a983824ddd42294ee963cbb11afb'
            '9ecf2b4714fe457bdc0edd8cc10db6d55b7e0c86ba85b0f3f7a49fa6159a5d57'
            '02ae481923b7f94b4852a5f706b97086245d2fa37aed4c5934dd77d38cf0d5de'
            'ba0fc30eab33ead695cffdba329dbadf8d05f67adac9a34fa905827a60421fcd')
install="${pkgname}.install"

prepare() {
  cd "${pkgname}-${pkgver}"
  # Copy (as rename) some icons
  cp -f "tn5250j-128.png" "tn5250j-128x128.png"
  cp -f "tn5250j-256.png" "tn5250j-256x256.png"
  cp -f "tn5250j-512.png" "tn5250j-512x512.png"
}

package() {
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  # Install startup script
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${pkgname}"

  cd "${pkgname}-${pkgver}"
  # Install java packages
  install -m 755 -d "${pkgdir}/usr/share/java/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/java/${pkgname}" "${pkgname}.jar"
  # Install icons
  for _size in 16 32 48 128 256 512
  do
    install -m 644 -D "${pkgname}-${_size}x${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
  install -m 644 -D "${srcdir}/${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "applet.txt"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "CHANGELOG.txt"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "e-mail.txt"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "filetransfers.txt"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "macros.txt"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "My5250App.html"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "My5250AppPlugin.html"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "My5250SSLApplet.php"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "My5250SSLindex.php"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "readme.txt"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "scripting.txt"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "SSLinstructions.html"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "tn5250jLaunchExternalProgram.txt"
}
