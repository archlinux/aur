# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gogland
pkgver=163.12024.20
pkgrel=1
pkgdesc='Capable and Ergonomic Go IDE'
arch=('x86_64' 'i686')
license=('Commercial')
url='https://www.jetbrains.com/go/'
options=('!strip')
optdepends=('java-environment>=8: use system java'
            'java-runtime-common: use system java')
source=(https://download.jetbrains.com/go/${pkgname}-${pkgver}.tar.gz
        jetbrains-gogland.desktop)
sha512sums=('5fe6553adf472f77632ff5df5fde2e6150a336d29725fab19f2ef11787e32d3747e9a486746dc9d5b740c58a7171708fcc6912f64d625cfc6a0a761dfc45baf7'
            '49d0ecaa2082c4325107b0ce6b1eeda2c6983a779c45d3a44be0888f4321797db8613dd8b724b43695bf6884c3150e505d44d1aa74cd6efed49ed0879181ef36')

package() {
  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/

  cp -a ${srcdir}/Gogland-${pkgver} ${pkgdir}/opt/${pkgname}
  # if using system java you may remove the bundled jre and save about 100M
  #rm -rf ${pkgdir}/opt/${pkgname}/jre

  ln -s /opt/${pkgname}/bin/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/jetbrains-${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 ${pkgdir}/opt/${pkgname}/bin/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

  chmod +x ${pkgdir}/opt/${pkgname}/bin/dlv
}
