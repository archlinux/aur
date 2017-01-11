# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gogland-eap
_pkgname=gogland
pkgver=163.10615.22
pkgrel=1
pkgdesc='Capable and Ergonomic Go IDE - EAP'
arch=('x86_64' 'i686')
options=('!strip')
url='http://www.jetbrains.com/go/'
license=('Commercial')
optdepends=('java-environment>=8: use system java'
            'java-runtime-common: use system java')
source=(https://download.jetbrains.com/go/${_pkgname}-${pkgver}.tar.gz
        jetbrains-gogland-eap.desktop)
sha512sums=('0f1bcc72ff56f0d4ccdaade6520d42504dd1ffa0b099d13da977f16a0df8a49ab463588a0f6c6889188abbcce3ef08720921b74c6c0eae1eccf82550bdda7049'
            '92ace1dfccb7df233d814dd80056eb2ca2b9e9ce1567b289ff76b174489fa3b42352d8aa3b28c05344207f293819320cd23c35e9c2088cda4ff0596aeb64ef87')

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
  install -D -m 644 ${pkgdir}/opt/${pkgname}/bin/${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

  chmod +x ${pkgdir}/opt/${pkgname}/bin/dlv
}
