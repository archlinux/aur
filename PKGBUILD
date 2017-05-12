# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgbase=gogland
pkgname=(gogland gogland-jre)
pkgver=171.4424.55
pkgrel=1
pkgdesc='Capable and Ergonomic Go IDE'
arch=('x86_64' 'i686')
license=('Commercial')
url='https://www.jetbrains.com/go/'
options=('!strip')
makedepends=('rsync')
source=(https://download.jetbrains.com/go/${pkgbase}-${pkgver}.tar.gz
        jetbrains-gogland.desktop)
sha512sums=('a21c127e52fc9a2828ddb92d59e02ef11603a4ae98007bb75c6c3d55d1380497008bb95b476db8c300a53c2373ea3667e245aa1fc20a91f1a34e54414c5081a5'
            '49d0ecaa2082c4325107b0ce6b1eeda2c6983a779c45d3a44be0888f4321797db8613dd8b724b43695bf6884c3150e505d44d1aa74cd6efed49ed0879181ef36')

package_gogland() {
  optdepends=('gogland-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime>=8: JRE - Required if gogland-jre is not installed')

  install -d -m 755 "${pkgdir}/opt/"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/applications/"
  install -d -m 755 "${pkgdir}/usr/share/pixmaps/"

  rsync -rtl "${srcdir}/Gogland-${pkgver}/" "${pkgdir}/opt/${pkgbase}" --exclude=/jre64

  ln -s "/opt/${pkgbase}/bin/${pkgbase}.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -D -m 644 "${srcdir}/jetbrains-${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m 644 "${pkgdir}/opt/${pkgbase}/bin/${pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_gogland-jre() {
  install -d -m 755 "${pkgdir}/opt/${pkgbase}"
  rsync -rtl "${srcdir}/Gogland-${pkgver}/jre64" "${pkgdir}/opt/${pkgbase}"
}
