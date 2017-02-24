# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgbase=gogland-eap
_pkgbase=gogland
pkgname=(gogland-eap gogland-eap-jre)
pkgver=163.12024.32
pkgrel=1
pkgdesc='Capable and Ergonomic Go IDE - EAP'
arch=('x86_64' 'i686')
license=('Commercial')
url='https://www.jetbrains.com/go/'
options=('!strip')
source=(https://download.jetbrains.com/go/${_pkgbase}-${pkgver}.tar.gz
        jetbrains-gogland-eap.desktop)
sha512sums=('138771e19c144829bed7d2ec4ed35befaae77781cf7ac47cce970887096ce33df950e39441447c91eb9946a7f508b844d3a315b877af3c85d407e03cf3c8daa2'
            '92ace1dfccb7df233d814dd80056eb2ca2b9e9ce1567b289ff76b174489fa3b42352d8aa3b28c05344207f293819320cd23c35e9c2088cda4ff0596aeb64ef87')

package_gogland-eap() {
  optdepends=('gogland-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime>=8: JRE - Required if gogland-eap-jre is not installed')

  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/

  rsync -rtl ${srcdir}/Gogland-${pkgver}/ ${pkgdir}/opt/${pkgbase} --exclude=/jre

  ln -s /opt/${pkgbase}/bin/${_pkgbase}.sh ${pkgdir}/usr/bin/${pkgbase}
  install -D -m 644 ${srcdir}/jetbrains-${pkgbase}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 ${pkgdir}/opt/${pkgbase}/bin/${_pkgbase}.png ${pkgdir}/usr/share/pixmaps/${pkgbase}.png

  chmod +x ${pkgdir}/opt/${pkgbase}/bin/dlv
}

package_gogland-eap-jre() {
  install -d -m 755 ${pkgdir}/opt/${pkgbase}
  rsync -rtl ${srcdir}/Gogland-${pkgver}/jre ${pkgdir}/opt/${pkgbase}
}
