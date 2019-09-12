# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgbase=goland-eap
pkgname=(goland-eap goland-eap-jre)
pkgver=193.2956.43
pkgrel=1
pkgdesc='Capable and Ergonomic Go IDE'
arch=('x86_64' 'i686')
url='https://www.jetbrains.com/go/'
license=('Commercial')
makedepends=('rsync')
options=('!strip')
source=(https://download.jetbrains.com/go/${pkgbase%-eap}-${pkgver}.tar.gz
        jetbrains-goland-eap.desktop)
sha512sums=('9aa3f266606b24ad12565a14c17dc92d59b6cf914919b5654b66e72569847d9390b104065bb8dc1642deafec40fa36998b1e70ab699b7f94a39d2254fc4e30b1'
            '23048f7fe57ff86e45ff62f047903f0ad976382084b93c86ba5d5991813f62771e901c365101471a6f42d4cd55f33532175223fce3f1c152edcadd0d3404e0ef')

package_goland-eap() {
  optdepends=('goland-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if goland-jre is not installed')
  conflicts=('gogland-eap')
  replaces=('gogland-eap')

  install -d -m 755 "${pkgdir}/opt/"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/applications/"
  install -d -m 755 "${pkgdir}/usr/share/pixmaps/"

  rsync -rtl "${srcdir}/GoLand-${pkgver}/" "${pkgdir}/opt/${pkgbase}" --exclude=/jbr

  ln -s "/opt/${pkgbase}/bin/${pkgbase%-eap}.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -D -m 644 "${srcdir}/jetbrains-${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m 644 "${pkgdir}/opt/${pkgbase}/bin/${pkgbase%-eap}.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_goland-eap-jre() {
  conflicts=('gogland-eap-jre')
  replaces=('gogland-eap-jre')

  install -d -m 755 "${pkgdir}/opt/${pkgbase}"
  rsync -rtl "${srcdir}/GoLand-${pkgver}/jbr" "${pkgdir}/opt/${pkgbase}"
}
