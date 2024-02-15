# Maintainer: RadioLogic <ncottrellweb at gmail dot com>

pkgname="hak5-payloadstudio-web"
pkgver=1.3.1
pkgrel=1
pkgdesc="Hak5 Payload Studio for writing and compiling DuckyScript"
url="https://payloadstudio.com/community/"
license=("none")
arch=("any")
provides=("${pkgname%-web}")
conflicts=("hak5-payloadstudio-html")
replaces=("hak5-payloadstudio-html")
makedepends=("wget")
install=${pkgname}.install
options=("!strip")

prepare() {
  # Downloading hak5 payload studio for future corrections
  wget --no-parent --no-host-directories --page-requisites --convert-links \
  --relative --directory-prefix=${srcdir} ${url}
}

pkgver() {
  # Grepping index file for version
  cat "${srcdir}/community/index.html" | tr '\n' ' ' | grep -oP 'Version\s+\K[0-9]+\.[0-9]+\.[0-9]+'
}

package() {
  # Installing into /usr/share
  install -d ${pkgdir}/usr/share/${pkgname%-web}/
  cp -r ${srcdir}/community/* ${pkgdir}/usr/share/${pkgname%-web}/

  # Setting proper permissions
  find ${pkgdir}/usr/share/${pkgname%-web}/ -type d -exec chmod 755 {} \;
  find ${pkgdir}/usr/share/${pkgname%-web}/ -type f -exec chmod 644 {} \;
  # chmod -R 755 ${pkgdir}/usr/share/${pkgname%-web}/
}
