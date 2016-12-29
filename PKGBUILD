# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gogland
pkgver=163.10615.6
pkgrel=2
pkgdesc='Capable and Ergonomic Go IDE'
arch=('x86_64' 'i686')
options=('!strip')
url='http://www.jetbrains.com/go/'
license=('Commercial')
optdepends=('java-environment>=8: use system java'
            'java-runtime-common: use system java')
source=(https://download.jetbrains.com/go/${pkgname}-${pkgver}.tar.gz
        jetbrains-gogland.desktop)
sha512sums=('1cbd081d4079428f6eb13ca9db27524afb09a5b3f772b7cf54c2aa0fe33d569fddae3035bda659094648d81904cc68fe4d60167e27c51b2376a243f7990bdfbe'
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
