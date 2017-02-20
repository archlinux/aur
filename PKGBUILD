# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgbase=gogland
pkgname=(gogland gogland-jre)
pkgver=163.12024.32
pkgrel=1
pkgdesc='Capable and Ergonomic Go IDE'
arch=('x86_64' 'i686')
license=('Commercial')
url='https://www.jetbrains.com/go/'
options=('!strip')
makedepends=('rsync')
source=(https://download.jetbrains.com/go/${pkgbase}-${pkgver}.tar.gz
        jetbrains-gogland.desktop)
sha512sums=('138771e19c144829bed7d2ec4ed35befaae77781cf7ac47cce970887096ce33df950e39441447c91eb9946a7f508b844d3a315b877af3c85d407e03cf3c8daa2'
            '49d0ecaa2082c4325107b0ce6b1eeda2c6983a779c45d3a44be0888f4321797db8613dd8b724b43695bf6884c3150e505d44d1aa74cd6efed49ed0879181ef36')

package_gogland() {
  optdepends=('gogland-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime>=8: JRE - Required if clion-jre is not installed')

  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/

  rsync -rtl ${srcdir}/Gogland-${pkgver}/ ${pkgdir}/opt/${pkgbase} --exclude=/jre

  ln -s /opt/${pkgbase}/bin/${pkgbase}.sh ${pkgdir}/usr/bin/${pkgbase}
  install -D -m 644 ${srcdir}/jetbrains-${pkgbase}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 ${pkgdir}/opt/${pkgbase}/bin/${pkgbase}.png ${pkgdir}/usr/share/pixmaps/${pkgbase}.png

  chmod +x ${pkgdir}/opt/${pkgbase}/bin/dlv
}

package_gogland-jre() {
  install -d -m 755 ${pkgdir}/opt/${pkgbase}
  rsync -rtl ${srcdir}/Gogland-${pkgver}/jre ${pkgdir}/opt/${pkgbase}
}
