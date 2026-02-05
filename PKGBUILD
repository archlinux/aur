# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=nmonvisualizer
pkgver=2025_01_01
_jarname=NMONVisualizer_${pkgver//_/-}.jar
pkgrel=1
pkgdesc="Java GUI tool for analyzing nmon system files from both AIX and Linux"
arch=('any')
url="https://nmonvisualizer.github.io/nmonvisualizer/"
license=('GPL')
depends=('java-runtime')
makedepends=('gendesk')
source=("https://github.com/nmonvisualizer/nmonvisualizer/releases/download/${pkgver//_/-}/NMONVisualizer_${pkgver//_/-}.jar")
noextract=(${_jarname})

prepare() {
  cd "${srcdir}"
  gendesk -f -n --pkgname "${pkgname}" \
                --name "NMONVisualizer" \
                --pkgdesc "${pkgdesc}" \
                --genericname "Nmon analyzer for AIX and Linux" \
                --exec "${pkgname} %F" \
                --categories "System;Viewer"
}

package() {
  cd "${srcdir}"
  install -Dm644 ${_jarname} "${pkgdir}"/usr/share/java/$pkgname/nmonvisualizer.jar
  install -Dm644 "${srcdir}"/${pkgname}.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop

#executable file
  install -d "${pkgdir}"/usr/bin
  cat <<"EOF" >"${pkgdir}"/usr/bin/nmonvisualizer
#!/bin/sh
java -jar /usr/share/java/nmonvisualizer/nmonvisualizer.jar "$@"
EOF
  chmod 755 "${pkgdir}"/usr/bin/$pkgname
}
md5sums=('52bc7fb57784e3642bf632e050de8eeb')
