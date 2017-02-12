# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=universal-gcode-sender
pkgver=1.0.9
pkgrel=1
pkgdesc="Java based GRBL compatible cross-platform G-Code sender"
arch=('any')
url="https://github.com/winder/Universal-G-Code-Sender"
license=('GPL3')
depends=('java-environment>=8')
makedepends=('maven')
provides=('universal-gcode-sender')
conflicts=('universal-gcode-sender-git')
source=("https://github.com/winder/Universal-G-Code-Sender/archive/v${pkgver}.tar.gz")
md5sums=('81398c99e535484172c5d4db4bde45cd')

build() {
  cd "${srcdir}/Universal-G-Code-Sender-${pkgver}"
  mvn package -DskipTests
}

check() {
  cd "${srcdir}/Universal-G-Code-Sender-${pkgver}"
  mvn test
}

package() {
  #cd "${srcdir}/Universal-G-Code-Sender-${pkgver}"
  #install -Dm 755 universal-gcode-sender.sh -T $pkgdir/usr/bin/ugs
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp "${srcdir}/Universal-G-Code-Sender-${pkgver}/target/UniversalGcodeSender.jar" "${pkgdir}/opt/${pkgname}/."
  cp "${srcdir}/Universal-G-Code-Sender-${pkgver}/release_files/start.sh" "${pkgdir}/opt/${pkgname}/."
  #install -Dm 644 target/UniversalGcodeSender.jar -t "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/start.sh" "${pkgdir}/usr/bin/ugs"
  #echo '#!/bin/sh' > "${pkgdir}/usr/bin/ugs"
  #echo "java -jar -Xmx512m /opt/${pkgname}/UniversalGcodeSender.jar" >> "${pkgdir}/usr/bin/ugs"
  #chmod +x "${pkgdir}/usr/bin/ugs"
}
