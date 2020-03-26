# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=goland-eap
pkgname=(goland-eap goland-eap-jre)
pkgver=201.6668.9
pkgrel=2
pkgdesc='Capable and Ergonomic Go IDE'
arch=('x86_64' 'i686')
url='https://www.jetbrains.com/go/'
license=('commercial')
depends=('glib2')
options=('!strip')
source=("https://download.jetbrains.com/go/${pkgbase%-eap}-${pkgver}.tar.gz"
        jetbrains-goland-eap.desktop
        LICENSE)
sha512sums=('ea7f7d94e49c8af15c4962b0bafb65b5b76b446be1c6ac5f901b5c956e15d9d077d509c8a1ffb5b9fbc72fa8a879898be843c1edb35d8397430726e09823713a'
            '8d8138f78be52ae814acedb51b361da26eabb28474173033f880249c772b7e0ea3b6b0f2fdd2eb04a8ed4eb072d639b6601114c8fd488efb06e753f57d7fa8ff'
            'e2aaaa75571f368f85bcc4baef27cc502781ce382bf04737763b07244716918fc2f0eb0b78b02631e242c9a5c246b27d720bb28556fc64bbde213403b7bf57f6')

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
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_goland-eap-jre() {
  pkgdesc='JBR (JetBrains Runtime) for Goland - a patched JRE'
  url='https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime'
  conflicts=('gogland-eap-jre')
  replaces=('gogland-eap-jre')

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/GoLand-${pkgver}/jbr "${pkgdir}"/opt/${pkgbase}
}
