# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=datagrip
pkgname=(datagrip datagrip-jre)
pkgver=2024.1.2
pkgrel=1
pkgdesc='Smart SQL Editor and Advanced Database Client Packed Together for Optimum Productivity'
arch=('any')
url='https://www.jetbrains.com/datagrip/'
license=('custom:jetbrains')
depends=('glib2')
conflicts=('0xdbe' '0xdbe-eap')
options=('!strip')
source=("https://download-cf.jetbrains.com/${pkgbase}/${pkgbase}-${pkgver}.tar.gz"
        jetbrains-datagrip.desktop
        LICENSE)
b2sums=('7b73bab666fcf615e042fa5c3d1ebab2a0cf112ae932542742c15b0e2b015454f573ce81bd06b3ebe3b52823d78732525cad6473a77d38dc885fca39efb6c381'
        '780f396da1c57c872b17e10576f2671346ad7c0442efec77369428b465befe772b5fd2c9c81a46ffe458472c2550082fb12adaf9d39b51fb41499bfb1bbca441'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

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
  url='https://github.com/JetBrains/JetBrainsRuntime'

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/DataGrip-${pkgver}/jbr "${pkgdir}"/opt/${pkgbase}
}
