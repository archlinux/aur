# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgbase=goland-eap
_pkgbase=goland
pkgname=(goland-eap goland-eap-jre)
pkgver=181.4203.206
pkgrel=1
pkgdesc='Capable and Ergonomic Go IDE'
arch=('x86_64' 'i686')
url='https://www.jetbrains.com/go/'
license=('Commercial')
makedepends=('rsync')
options=('!strip')
source=(https://download.jetbrains.com/go/${_pkgbase}-${pkgver}.tar.gz
        jetbrains-goland-eap.desktop)
sha512sums=('4c82a23d9d17d28e8bf7fc74d7f67dfda67f6eb43be14c5d7e5f15baa3f2664159d788f885585abce9ee79cb607b5bd350f7a5f5a824c6dce0a3d816a5e43ad9'
            '23048f7fe57ff86e45ff62f047903f0ad976382084b93c86ba5d5991813f62771e901c365101471a6f42d4cd55f33532175223fce3f1c152edcadd0d3404e0ef')

package_goland-eap() {
  optdepends=('goland-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime>=8: JRE - Required if goland-jre is not installed')
  conflicts=('gogland-eap')
  replaces=('gogland-eap')

  install -d -m 755 "${pkgdir}/opt/"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/applications/"
  install -d -m 755 "${pkgdir}/usr/share/pixmaps/"

  rsync -rtl "${srcdir}/GoLand-${pkgver}/" "${pkgdir}/opt/${pkgbase}" --exclude=/jre64

  ln -s "/opt/${pkgbase}/bin/${_pkgbase}.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -D -m 644 "${srcdir}/jetbrains-${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m 644 "${pkgdir}/opt/${pkgbase}/bin/${_pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_goland-eap-jre() {
  conflicts=('gogland-eap-jre')
  replaces=('gogland-eap-jre')

  install -d -m 755 "${pkgdir}/opt/${pkgbase}"
  rsync -rtl "${srcdir}/GoLand-${pkgver}/jre64" "${pkgdir}/opt/${pkgbase}"
}
