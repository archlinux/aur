# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgbase=goland-eap
pkgname=(goland-eap goland-eap-jre)
pkgver=193.5233.18
pkgrel=1
pkgdesc='Capable and Ergonomic Go IDE'
arch=('x86_64' 'i686')
url='https://www.jetbrains.com/go/'
license=('Commercial')
depends=('glib2')
options=('!strip')
source=("https://download.jetbrains.com/go/${pkgbase%-eap}-${pkgver}.tar.gz"
        jetbrains-goland-eap.desktop)
sha512sums=('e72a4b5e96248901b571c785171b6c5cd5664e3f3841a1fc5de984dac3a2bb9b7a91ad7a1d9c83496a06b7c159b407bc27e209eb352039718b27d561e297c808'
            '23048f7fe57ff86e45ff62f047903f0ad976382084b93c86ba5d5991813f62771e901c365101471a6f42d4cd55f33532175223fce3f1c152edcadd0d3404e0ef')

package_goland-eap() {
  optdepends=('goland-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if goland-jre is not installed')
  conflicts=('gogland-eap')
  replaces=('gogland-eap')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/GoLand-${pkgver}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s "/opt/${pkgbase}/bin/${pkgbase%-eap}.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -m644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase%-eap}.png "${pkgdir}"/usr/share/pixmaps/${pkgbase}.png
}

package_goland-eap-jre() {
  pkgdesc='JBR (JetBrains Runtime) for Goland - a patched JDK'
  url='https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime'
  conflicts=('gogland-eap-jre')
  replaces=('gogland-eap-jre')

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/GoLand-${pkgver}/jbr "${pkgdir}"/opt/${pkgbase}
}
