# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=datagrip
pkgname=(datagrip datagrip-jre)
pkgver=2019.3.4
pkgrel=1
pkgdesc='Smart SQL Editor and Advanced Database Client Packed Together for Optimum Productivity'
arch=('any')
url='http://www.jetbrains.com/datagrip/'
license=('commercial')
depends=('glib2')
conflicts=('0xdbe' '0xdbe-eap')
options=('!strip')
source=("https://download.jetbrains.com/${pkgbase}/${pkgbase}-${pkgver}.tar.gz"
        jetbrains-datagrip.desktop
        LICENSE)
sha512sums=('0e553532f606d48b7dc584e027e2e9dba974c3b36a8a4cc7b58325f44b571c51fef9191949c778846c47a6e001ef6a54e17a89815a3fa663d16e3ad0fbb527c1'
            'eb1a233a993dfa7a338488ed34868ae36e1315186b6216bb0a2fee0347c5103578b8733be7465a7128e4aaa61884b38c9586e5474f4d95ce90803b26edb6fbc4'
            'e2aaaa75571f368f85bcc4baef27cc502781ce382bf04737763b07244716918fc2f0eb0b78b02631e242c9a5c246b27d720bb28556fc64bbde213403b7bf57f6')

package_datagrip() {
  optdepends=('datagrip-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if datagrip-jre is not installed')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/DataGrip-${pkgver}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/${pkgbase}.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -m644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_datagrip-jre() {
  pkgdesc='JBR (JetBrains Runtime) for DataGrip - a patched JRE'
  url='https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime'

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/DataGrip-${pkgver}/jbr "${pkgdir}"/opt/${pkgbase}
}
