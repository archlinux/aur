# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gogland
pkgver=163.12024.27
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
sha512sums=('61e5d3135937fba61a3aae79b1617938ece1dc4cdd6d3d0215bf064591f6fe8536a0c2c709f471443b6919f66f58dc87b48a90a3aa79902f87f2446f98bf81d8'
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
