# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picapport
pkgver=10.4.00
pkgrel=1
pkgdesc="An easy-to-use, free of charge, photo server for your home network"
arch=(any)
url="https://www.${pkgname}.de"
license=('CC BY-NC-ND 4.0')
depends=('java-runtime-headless' 'shared-mime-info')
optdepends=('java-openjfx: for running the interactive GUI')
source=(${pkgname}-${pkgver}.jar::${url}/prepare_download.php?dlfile=${pkgver//\./-}/picapport.jar)
sha512sums=('ae662662c8086b6f35cdc9e828b04a129d6c13b096ff91375bc997b24132975311c0880fec8ad3df24d2bd3057240e5d5f2926740f51574ee940b920115d3d05')

package() {
  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -d "${pkgdir}/usr/bin"
  cat <<"EOF" >"${pkgdir}/usr/bin/${pkgname}"
#!/bin/sh
java -cp /usr/share/java/picapport/picapport.jar de.contecon.picapport.PicApport "$@"
EOF
  cat <<"EOF" >"${pkgdir}/usr/bin/${pkgname}-headless"
#!/bin/sh
java -cp /usr/share/java/picapport/picapport.jar de.contecon.picapport.PicApport -pgui.enabled=false "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${pkgname}-headless"
}
