# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgbase=gogland
pkgname=(gogland gogland-jre)
pkgver=171.4694.61
pkgrel=1
pkgdesc='Capable and Ergonomic Go IDE'
arch=('x86_64' 'i686')
url='https://www.jetbrains.com/go/'
license=('Commercial')
makedepends=('rsync')
options=('!strip')
source=(https://download.jetbrains.com/go/${pkgbase}-${pkgver}.tar.gz
        jetbrains-gogland.desktop)
sha512sums=('ade4a28e0f953ce8d9b64aeadc8c86417613fd02308b481ebb3e68e8a3d556c9536e7585471149b6c59141bc2317da98e501fec0dc4480fddec69675f40a85c9'
            '49d0ecaa2082c4325107b0ce6b1eeda2c6983a779c45d3a44be0888f4321797db8613dd8b724b43695bf6884c3150e505d44d1aa74cd6efed49ed0879181ef36')

package_gogland() {
  optdepends=('gogland-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime>=8: JRE - Required if gogland-jre is not installed')

  install -d -m 755 "${pkgdir}/opt/"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/applications/"
  install -d -m 755 "${pkgdir}/usr/share/pixmaps/"

  rsync -rtl "${srcdir}/Gogland-${pkgver}/" "${pkgdir}/opt/${pkgbase}" --exclude=/jre64

  chmod +x "${pkgdir}/opt/${pkgbase}/plugins/intellij-go-plugin/lib/dlv/linux/dlv"
  ln -s "/opt/${pkgbase}/bin/${pkgbase}.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -D -m 644 "${srcdir}/jetbrains-${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m 644 "${pkgdir}/opt/${pkgbase}/bin/${pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_gogland-jre() {
  install -d -m 755 "${pkgdir}/opt/${pkgbase}"
  rsync -rtl "${srcdir}/Gogland-${pkgver}/jre64" "${pkgdir}/opt/${pkgbase}"
}
