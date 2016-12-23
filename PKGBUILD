# Maintainer: Eddie Ringle <eddie@ringle.io>

pkgname=gogland-preview
_pkgname=gogland
_dirname=Gogland
pkgver=163.10615.6
pkgrel=1
pkgdesc='Capable and Ergonomic Go IDE'
arch=('x86_64' 'i686')
options=('!strip')
url='http://www.jetbrains.com/go/'
license=('Commercial')
optdepends=('java-environment>=8: use system java'
            'java-runtime-common: use system java')
source=("https://download.jetbrains.com/go/${_pkgname}-${pkgver}.tar.gz"
        com.jetbrains.${pkgname}.desktop)
sha512sums=(
  "1cbd081d4079428f6eb13ca9db27524afb09a5b3f772b7cf54c2aa0fe33d569fddae3035bda659094648d81904cc68fe4d60167e27c51b2376a243f7990bdfbe"
  "7434fdfc6a957c7b6cd195cfd5f88864f6c6e0d4ed0eae801df08ec13cca9237e8728cc4ccd5c06d9966838dedcc97c584b65e6fd7836c6bc4c93402bd008c6c"
)

package() {
  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/

  cp -a ${srcdir}/${_dirname}-${pkgver} ${pkgdir}/opt/${pkgname}
  # if using system java you may remove the bundled jre and save about 100M
  #rm -rf ${pkgdir}/opt/${pkgname}/jre

  ln -s /opt/${pkgname}/bin/${_pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/com.jetbrains.${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 ${pkgdir}/opt/${pkgname}/bin/${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
