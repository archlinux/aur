# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgbase=gogland-eap
_pkgbase=gogland
pkgname=(gogland-eap gogland-eap-jre)
pkgver=172.3757.46
pkgrel=1
pkgdesc='Capable and Ergonomic Go IDE - EAP'
arch=('x86_64' 'i686')
url='https://www.jetbrains.com/go/'
license=('Commercial')
options=('!strip')
source=(https://download.jetbrains.com/go/${_pkgbase}-${pkgver}.tar.gz
        jetbrains-gogland-eap.desktop)
sha512sums=('a94bb4d54179fe276cffaa95a0f7afa7683f14cc0327b076b018b5dac64661d8081c190849aa8370bc4c48bd66ec388ddcb11e1bc113741c5c107bd52b715713'
            '92ace1dfccb7df233d814dd80056eb2ca2b9e9ce1567b289ff76b174489fa3b42352d8aa3b28c05344207f293819320cd23c35e9c2088cda4ff0596aeb64ef87')

package_gogland-eap() {
  optdepends=('gogland-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime>=8: JRE - Required if gogland-eap-jre is not installed')

  install -d -m 755 "${pkgdir}/opt/"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/applications/"
  install -d -m 755 "${pkgdir}/usr/share/pixmaps/"

  rsync -rtl "${srcdir}/Gogland-${pkgver}/" "${pkgdir}/opt/${pkgbase}" --exclude=/jre64

  chmod +x "${pkgdir}/opt/${pkgbase}/plugins/intellij-go-plugin/lib/dlv/linux/dlv"
  ln -s "/opt/${pkgbase}/bin/${_pkgbase}.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -D -m 644 "${srcdir}/jetbrains-${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m 644 "${pkgdir}/opt/${pkgbase}/bin/${_pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_gogland-eap-jre() {
  install -d -m 755 "${pkgdir}/opt/${pkgbase}"
  rsync -rtl "${srcdir}/Gogland-${pkgver}/jre64" "${pkgdir}/opt/${pkgbase}"
}
