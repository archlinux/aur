# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=goland-eap
pkgname=(goland-eap goland-eap-jre)
#rlsver=2021.2
pkgver=241.8102.131
pkgrel=1
pkgdesc='Capable and Ergonomic Go IDE'
arch=('x86_64' 'i686')
url='https://www.jetbrains.com/go/'
license=('custom:jetbrains')
depends=('glib2')
options=('!strip')
source=("https://download.jetbrains.com/go/${pkgbase%-eap}-${pkgver}.tar.gz"
        jetbrains-goland-eap.desktop
        LICENSE)
b2sums=('9887af73115f8d2ec78d7ebb82b11c1b8a394e950e6f3e7c4915c8815502a396a70da446ffe456573901aff8db04af9cd068f08af39f05882b43393be6b8db28'
        'b985586e25598fbe87d697403e87ed45f8ce7b944e6d3ba02509f4c6f2544e3b7a55f19861d399dadcae699db894d3f2be73039401ac004370115f3cefc1fe9c'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package_goland-eap() {
  optdepends=('goland-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if goland-jre is not installed')
  conflicts=('gogland-eap')
  replaces=('gogland-eap')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/GoLand-${rlsver:-${pkgver}}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s "/opt/${pkgbase}/bin/${pkgbase%-eap}.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -m644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase%-eap}.png "${pkgdir}"/usr/share/pixmaps/${pkgbase}.png
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_goland-eap-jre() {
  pkgdesc='JBR (JetBrains Runtime) for Goland - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'
  conflicts=('gogland-eap-jre')
  replaces=('gogland-eap-jre')

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/GoLand-${rlsver:-${pkgver}}/jbr "${pkgdir}"/opt/${pkgbase}
}
