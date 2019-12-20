# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgbase=datagrip
pkgname=(datagrip datagrip-jre)
pkgver=2019.3.1
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
sha512sums=('73d5c4ca6c500f6aedaf56eaddad9ed85e9e1910d3519dae7748e101d854284a7b7a05259bd190b939cf9b41f4dcf2f4c68df1b5bffc3d8ac08ed71475d1b854'
            '4172c0c7065a91148c7b5b2bec1f84572fc7d302cd63e2f132f66297fd96c3969c403975a1eec93ec5d931406a7631fd9972222752d924338ed2b2cee44ba052'
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
