# Contributor: hauzer <alokinpwn@gmail.com>
# Previous Maintainer: Mineko
# Previous Maintainer: Ben R <thebenj88 *AT* gmail *DOT* com>
# Maintainer: maraku <maraku@gmx.com>

pkgname=spiral-knights
pkgver=20140522
pkgrel=1
pkgdesc="The Spiral Knights have awoken on an alien world. Their equipment stores have been raided and their starship, The Skylark, will not recover from the crash. They must work together to survive on a journey that will take them to the very core of the world."
arch=('any')
url="http://spiralknights.com/"
license=('custom:Three Rings License')
depends=('java-runtime')
install="${pkgname}.install"
source=("http://download.threerings.net/spiral/client/spiral-install.bin")
sha256sums=('SKIP')

build() {
   chmod +x "${srcdir}/spiral-install.bin"
   "${srcdir}/spiral-install.bin" --noexec --keep --nochown --target "${srcdir}/${pkgname}-${pkgver}"
}

package() {
   cat > ${pkgname} << EOF
      #!/bin/bash
      /opt/${pkgname}/spiral
EOF

   cat > ${pkgname}.desktop << EOF
      [Desktop Entry]
      Type=Application
      Version=1.0
      Name=Spiral Knights
      Icon=/opt/${pkgname}/icon_32.png
      Exec=${pkgname}
      Terminal=false
      Categories=Game;Java;
EOF

  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/background.png" "${pkgdir}/opt/${pkgname}/background.png"
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/desktop.png" "${pkgdir}/opt/${pkgname}/desktop.png"
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/getdown-pro.jar" "${pkgdir}/opt/${pkgname}/getdown-pro.jar"
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/getdown.txt" "${pkgdir}/opt/${pkgname}/getdown.txt"
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/icon_128.png" "${pkgdir}/opt/${pkgname}/icon_128.png"
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/icon_16.png" "${pkgdir}/opt/${pkgname}/icon_16.png"
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/icon_32.png" "${pkgdir}/opt/${pkgname}/icon_32.png"
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/license.txt" "${pkgdir}/opt/${pkgname}/license.txt"
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/progress.png" "${pkgdir}/opt/${pkgname}/progress.png"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/spiral" "${pkgdir}/opt/${pkgname}/spiral"

  install -D -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 664 "${srcdir}/${pkgname}-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ln -s "${JAVA_HOME}/bin/java" "${pkgdir}/opt/${pkgname}/java"
  chgrp games "${pkgdir}/opt/${pkgname}" && chmod 775 "${pkgdir}/opt/${pkgname}"
}

