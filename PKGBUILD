# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=piwigo-remote-sync
_jarname=remotesync-ui.jar
pkgver=1.0_beta
pkgrel=1
pkgdesc="GUI for uploading images to Piwigo server"
arch=('any')
url="https://github.com/Piwigo/Piwigo-Java"
license=('GPL')
depends=('java-runtime')
makedepends=('gendesk')
source=("https://github.com/Piwigo/Piwigo-Java/releases/download/1.0-beta/remotesync-ui.jar"
        "piwigo-remote-sync.png")
noextract=("$_jarname")

prepare() {
  cd "${srcdir}"
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --exec "remotesync-ui" --categories "Utility"
}

package() {
  cd "${srcdir}"
  install -Dm644 ${_jarname} "${pkgdir}"/usr/share/java/$pkgname/remotesync-ui.jar

#executable file
  install -d "${pkgdir}/usr/bin"
  cat <<"EOF" >"${pkgdir}"/usr/bin/remotesync-ui
#!/bin/sh
exec java -jar /usr/share/java/piwigo-remote-sync/remotesync-ui.jar
EOF
  chmod 755 "${pkgdir}/usr/bin/remotesync-ui"

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

md5sums=('ba04afc333b1022dd73d1aa3853cdae6'
         '69ef2358a4cbc075847a2d2e2a6e4486')
